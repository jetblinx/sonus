import 'package:stack_trace/stack_trace.dart';

class Logger {
  static bool isActive = true;
  static void log (String message) {
    if (isActive) print("[${new DateTime.now()}] From ${Frame.caller(1).uri.path}: $message");
  }
}