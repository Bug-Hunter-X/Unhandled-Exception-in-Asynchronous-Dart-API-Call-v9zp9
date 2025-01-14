```dart
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  int retries = 3;
  int retryDelay = 2000; // 2 seconds

  while (retries > 0) {
    try {
      final response = await http.get(Uri.parse('https://api.example.com/data'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('API request failed with status code: ${response.statusCode}. Retries remaining: $retries');
        retries--;
        if(retries > 0) await Future.delayed(Duration(milliseconds: retryDelay));
      }
    } on SocketException catch (e) {
      print('Network error: $e. Retries remaining: $retries');
      retries--;
      if(retries > 0) await Future.delayed(Duration(milliseconds: retryDelay));
    } on TimeoutException catch (e) {
      print('Timeout error: $e. Retries remaining: $retries');
      retries--;
      if(retries > 0) await Future.delayed(Duration(milliseconds: retryDelay));
    } on FormatException catch (e) {
      print('Invalid JSON format: $e');
      return null; // Or throw a custom exception
    } catch (e) {
      print('Unexpected error: $e. Retries remaining: $retries');
      retries--;
      if(retries > 0) await Future.delayed(Duration(milliseconds: retryDelay));
    }
  }
  print('All retries failed.');
  return null; 
}
```