import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/bullet_text.dart';
import 'package:flutter/material.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: ResponsiveMobileUtils.getResponsiveSize(context, 40),
              height: ResponsiveMobileUtils.getResponsiveSize(context, 40),
              decoration: BoxDecoration(
                color: MyColor.third,
                borderRadius: BorderRadius.circular(
                    ResponsiveMobileUtils.getResponsiveSize(context, 12)),
              ),
              child: Image.asset(
                image,
                height: ResponsiveMobileUtils.getResponsiveSize(context, 32),
                width: ResponsiveMobileUtils.getResponsiveSize(context, 32),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: ResponsiveMobileUtils.getResponsiveSize(context, 8),
            ),
            Text(
              title,
              style: TextStyle(
                color: MyColor.white,
                fontWeight: FontWeight.w900,
                fontSize: ResponsiveMobileUtils.getResponsiveSize(
                  context,
                  16,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ResponsiveMobileUtils.getResponsiveSize(context, 8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: lines.map((line) => BulletText(line!)).toList(),
        ),
      ],
    );
  }
}