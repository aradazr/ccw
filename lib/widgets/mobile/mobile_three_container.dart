import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class MobileThreeContainer extends StatefulWidget {
  const MobileThreeContainer({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  State<MobileThreeContainer> createState() => _MobileThreeContainerState();
}

class _MobileThreeContainerState extends State<MobileThreeContainer> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: ResponsiveMobileUtils.getResponsiveSize(context, 165),
        width: ResponsiveMobileUtils.getResponsiveSize(context, 370),
        decoration: BoxDecoration(
          color: _isHovered ? MyColor.hoverCartColor : const Color(0xFF222A2F),
          borderRadius: BorderRadius.circular(ResponsiveMobileUtils.getResponsiveSize(context, 24)),
          border: _isHovered
              ? Border(bottom: BorderSide(color: MyColor.secendry, width: 5))
              : null,
        ),
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 16.64),
            ),
            Container(
              alignment: Alignment.center,
              height: ResponsiveMobileUtils.getResponsiveSize(context, 40),
              width: ResponsiveMobileUtils.getResponsiveSize(context, 40),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff10BC69),
              ),
              child: Image.asset(
                widget.image,
                height: ResponsiveMobileUtils.getResponsiveSize(context, 20),
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 12),
            ),
            Text(
              textAlign: TextAlign.center,
              widget.title,
              style: TextStyle(
                fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                color: MyColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 4),
            ),
            SizedBox(
              width: ResponsiveMobileUtils.getResponsiveSize(context, 252),
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.center,
                widget.description,
                style: TextStyle(
                  height: 1.5,
                  fontSize:
                      ResponsiveMobileUtils.getResponsiveSize(context, 12),
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
