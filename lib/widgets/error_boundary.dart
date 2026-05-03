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
    return Container(
      color: DesignSystem.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                decoration: BoxDecoration(
                  color: DesignSystem.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  color: DesignSystem.error,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              const Text(
                'Something went wrong',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              Text(
                _error ?? widget.errorMessage ?? 'An unexpected error occurred',
                style: const TextStyle(fontSize: 16),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(
              color: DesignSystem.primary,
              strokeWidth: 3.0,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              message!,
              style: const TextStyle(fontSize: 14),
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: DesignSystem.textSecondary.withValues(alpha: 0.1),
        borderRadius:
            borderRadius ?? BorderRadius.circular(DesignSystem.radiusMedium),
      ),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: DesignSystem.primary,
          ),
        ),
      ),
    );
  }
}
