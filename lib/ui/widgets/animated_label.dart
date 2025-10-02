import 'package:flutter/widgets.dart';

class AnimatedLabel extends StatefulWidget {
  final String label;
  final TextStyle? style;
  final Duration duration;

  const AnimatedLabel({
    required this.label,
    this.style,
    this.duration = const Duration(milliseconds: 350),
    super.key,
  });

  @override
  AnimatedLabelState createState() => AnimatedLabelState();
}

class AnimatedLabelState extends State<AnimatedLabel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _translateAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.25), end: Offset.zero)
            .animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedLabel oldWidget) {
    if (oldWidget.label != widget.label) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _translateAnimation,
        child: Text(
          widget.label,
          style: widget.style,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
