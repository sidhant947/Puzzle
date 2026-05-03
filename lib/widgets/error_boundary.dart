import 'package:flutter/material.dart';
import '../utils/design_system.dart';

/// A widget that catches and displays errors gracefully
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorMessage,
    this.onRetry,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  String? _error;

  @override
  void initState() {
    super.initState();
    // Set up error handling for this boundary
    FlutterError.onError = (details) {
      if (mounted) {
        setState(() {
          _error = details.exception.toString();
        });
      }
    };
  }

  void _clearError() {
    if (mounted) {
      setState(() {
        _error = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return _buildErrorWidget();
    }
    return widget.child;
  }

  Widget _buildErrorWidget() {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.1),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: theme.colorScheme.error, width: 1),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  color: theme.colorScheme.error,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              Text(
                'Something went wrong',
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              Text(
                _error ?? widget.errorMessage ?? 'An unexpected error occurred',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (widget.onRetry != null) ...[
                const SizedBox(height: DesignSystem.spaceXL),
                ElevatedButton(
                  onPressed: () {
                    widget.onRetry!();
                    _clearError();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A reusable loading indicator widget
class LoadingIndicator extends StatelessWidget {
  final String? message;
  final double size;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
              strokeWidth: 3.0,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              message!,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

/// A widget that shows a placeholder when content is loading
class LoadingShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const LoadingShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: borderRadius ?? BorderRadius.zero,
        border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), width: 1),
      ),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
