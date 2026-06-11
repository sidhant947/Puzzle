import 'package:flutter/foundation.dart';

enum ErrorSeverity { low, medium, high, critical }

class AppError {
  final String message;
  final String? code;
  final ErrorSeverity severity;
  final dynamic originalError;
  final StackTrace? stackTrace;
  final Map<String, dynamic>? metadata;

  const AppError({
    required this.message,
    this.code,
    this.severity = ErrorSeverity.medium,
    this.originalError,
    this.stackTrace,
    this.metadata,
  });

  @override
  String toString() => 'AppError($code): $message';
}

class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._();
  factory ErrorHandler() => _instance;
  ErrorHandler._();

  final List<AppError> _errorLog = [];
  final int _maxLogSize = 100;

  List<AppError> get errorLog => List.unmodifiable(_errorLog);

  void report(AppError error) {
    _errorLog.add(error);
    if (_errorLog.length > _maxLogSize) {
      _errorLog.removeAt(0);
    }

    if (kDebugMode) {
      debugPrint('[ERROR] ${error.severity.name.toUpperCase()}: ${error.message}');
      if (error.code != null) debugPrint('  Code: ${error.code}');
      if (error.originalError != null) debugPrint('  Original: ${error.originalError}');
    }

    _sendToAnalytics(error);
  }

  void _sendToAnalytics(AppError error) {
    // Placeholder for analytics integration
    // In production, send to Firebase Crashlytics, Sentry, etc.
  }

  void clear() => _errorLog.clear();

  AppError? get lastError => _errorLog.isEmpty ? null : _errorLog.last;
}
