import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  final bool addShadow;

  const Hover({
    super.key,
    required this.child,
    this.scale = 1.08,
    this.duration = const Duration(milliseconds: 300),
    this.addShadow = false,
  });

  @override
  State<Hover> createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final scaleValue = isHovered ? widget.scale : 1.0;
    
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: widget.duration,
        transform: Matrix4.diagonal3Values(scaleValue, scaleValue, 1.0),
        curve: Curves.easeInOut,
        decoration: widget.addShadow
            ? BoxDecoration(
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ]
                    : [],
              )
            : null,
        child: widget.child,
      ),
    );
  }
}