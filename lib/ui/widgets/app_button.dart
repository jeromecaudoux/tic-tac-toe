import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/tools.dart';

typedef OnButtonPressed = FutureOr<void> Function();

enum ButtonType { elevated, text, outlined }

class AppButton extends StatefulWidget {
  final OnButtonPressed onPressed;
  final Alignment? alignment;
  final Color? backgroundColor;
  final bool isDense;
  final Widget child;
  final ButtonType type;

  const AppButton({
    required this.onPressed,
    required this.child,
    this.isDense = false,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.type = ButtonType.elevated,
    super.key,
  });

  @override
  State<AppButton> createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  bool _isLoading = false;

  dynamic error;
  dynamic stack;

  void _showErrorDetails() {
    if (error != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error Details'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Error: $error'),
                  if (stack != null) ...[
                    const SizedBox(height: 8),
                    Text('Stack Trace:\n$stack'),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '$error\n$stack'));
                  showAppToast('Copied to clipboard');
                },
                child: const Text('Copy'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _buildProgress(),
        AnimatedOpacity(
          duration: transitionDuration,
          opacity: _isLoading ? 0 : 1,
          child: widget.child,
        ),
      ],
    );
    Widget child = _buildButton(body);
    if (widget.alignment == null) {
      return child;
    }
    return Align(alignment: widget.alignment!, child: child);
  }

  Widget _buildProgress() {
    return AnimatedSwitcher(
      duration: transitionDuration,
      child: _isLoading
          ? SizedBox.square(
              dimension: space.normal,
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          : const SizedBox.shrink(),
    );
  }

  void onPressed() {
    if (_isLoading) {
      return;
    }
    final result = widget.onPressed();
    if (result is Future) {
      setState(() {
        _isLoading = true;
      });
      result
          .catchError((e, s) {
            debugPrint('$e\n$s');
            error = e;
            stack = s;
            if (mounted) {
              showAppToast(getMessage(context, e));
            }
          })
          .whenComplete(() {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          });
    }
  }

  Widget _buildButton(Widget body) {
    switch (widget.type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          onLongPress: error != null ? _showErrorDetails : null,
          style: ElevatedButton.styleFrom(
            tapTargetSize: widget.isDense
                ? MaterialTapTargetSize.shrinkWrap
                : MaterialTapTargetSize.padded,
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(
              horizontal: widget.isDense ? space.halfAndQuarter : space.normal,
              vertical: widget.isDense ? space.quarter : space.half,
            ),
            backgroundColor: widget.backgroundColor,
          ),
          child: body,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
          ),
          child: body,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: widget.backgroundColor,
          ),
          child: body,
        );
    }
  }
}
