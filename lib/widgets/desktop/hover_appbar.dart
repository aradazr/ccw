import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final TextStyle defaultStyle;
  const HoverText({super.key, required this.text, required this.defaultStyle});

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Text(
        widget.text,
        style: widget.defaultStyle.copyWith(
          color: isHovered ? MyColor.primary : widget.defaultStyle.color,
        ),
      ),
    );
  }
}