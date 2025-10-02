import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/tools.dart';

class PointerScaleEffect extends StatefulWidget {
  final double scale;
  final Widget child;
  final Alignment alignment;
  final VoidCallback? onTap;
  final bool enable;

  const PointerScaleEffect({
    required this.child,
    this.onTap,
    this.enable = true,
    this.scale = 0.01,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  State<PointerScaleEffect> createState() => _PointerScaleEffectState();
}

class _PointerScaleEffectState extends State<PointerScaleEffect> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enable) {
      return widget.child;
    }
    return Listener(
      onPointerDown: (_) => _onPointer(true),
      onPointerUp: (_) => _onPointer(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _pressed ? 1 - widget.scale : 1,
          duration: transitionDuration,
          alignment: widget.alignment,
          child: widget.child,
        ),
      ),
    );
  }

  void _onPointer(bool pressed) {
    if (mounted) {
      setState(() {
        _pressed = pressed;
      });
    }
  }
}
