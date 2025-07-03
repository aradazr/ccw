import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/desktop/desktop_bullet_text.dart';
import 'package:flutter/material.dart';

class DesktopServicesItem extends StatelessWidget {
  const DesktopServicesItem({
    super.key,
    required this.image,
    required this.title,
    this.line1,
    this.line2,
    this.line3,
    this.line4,
    this.line5,
    this.line6,
  });

  final String image;
  final String title;
  final String? line1;
  final String? line2;
  final String? line3;
  final String? line4;
  final String? line5;
  final String? line6;

  @override
  Widget build(BuildContext context) {
    // لیست خطوط غیر خالی
    final lines = [
      line1,
      line2,
      line3,
      line4,
      line5,
      line6,
    ].where((line) => line != null && line!.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          spacing: ResponsiveDesktopUtils.getResponsiveSize(context, 12),
          children: [
            Container(
              alignment: Alignment.center,
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 64),
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 64),
              decoration: BoxDecoration(
                color: MyColor.third,
                borderRadius: BorderRadius.circular(
                    ResponsiveDesktopUtils.getResponsiveSize(context, 12)),
              ),
              child: Image.asset(
                image,
                height: ResponsiveDesktopUtils.getResponsiveSize(context, 40),
                width: ResponsiveDesktopUtils.getResponsiveSize(context, 40),
                fit: BoxFit.cover,
              ),
            ),
            
            Text(
              title,
              style: TextStyle(
                color: MyColor.white,
                fontWeight: FontWeight.w900,
                fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                  context,
                  24,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ResponsiveDesktopUtils.getResponsiveSize(context, 8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lines.map((line) => DesktopBulletText(line!)).toList(),
        ),
      ],
    );
  }
}