import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class ThreeContainer extends StatefulWidget {
  const ThreeContainer({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  State<ThreeContainer> createState() => _ThreeContainerState();
}

class _ThreeContainerState extends State<ThreeContainer> {
  bool _isHovered = false;
  int tabletScreenSize = 1200;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: size.width/4.47,
        width: size.width/4.76,
        decoration: BoxDecoration(
          color: _isHovered ? MyColor.hoverCartColor : const Color(0xFF222A2F),
          borderRadius: BorderRadius.circular(13),
          border: _isHovered
              ? Border(bottom: BorderSide(color: MyColor.secendry, width: 5))
              : null,
        ),
        child: Column(
          children: [
            SizedBox(height:size.width/42.60),
            Container(
              alignment: Alignment.center,
              height:size.width/20.31,
              width: size.width/20.31,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff10BC69),
              ),
              child: Image.asset(
                widget.image,
                height:size.width/36.56,
              ),
            ),
             SizedBox(height:size.width/43.53),
            Text(
              textAlign: TextAlign.center,
              widget.title,
              style: TextStyle(
                fontSize: width /60,
                color: MyColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height / 60),
            SizedBox(
              width: size.width / 5.5,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.center,
                widget.description,
                style: TextStyle(
                  height: 1.5,
                  fontSize:size.width/90,
                  color: MyColor.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
