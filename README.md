# Unhandled Exception in Asynchronous Dart API Call

This repository demonstrates a common error in asynchronous Dart code: improper exception handling in an API call. The `fetchData` function makes an HTTP request to an API.  If the request fails (due to network issues, server errors, etc.), it throws an exception.  However, the current exception handling is minimal—it merely prints an error message and rethrows the exception. This leaves the calling code vulnerable and may lead to application crashes or unexpected behavior.

## How to Reproduce

1. Clone this repository.
2. Run `fetchData()` from `bug.dart`. If the API is unavailable, the exception will be printed but not fully handled.

## Solution

The `bugSolution.dart` file provides a more robust solution.  It includes:

* **More informative error messages:**  Provides context to the user.
* **Retry mechanism:** Attempts to retry the request after a delay in case of temporary network issues.
* **Proper error handling:** Catches specific exceptions and handles them appropriately.
* **Clearer separation of concerns:** Isolates error handling from core logic.

This example highlights the importance of comprehensive error handling in asynchronous operations to build robust and reliable Dart applications.