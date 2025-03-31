import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class MobileWhoWeHelp extends StatelessWidget {
  const MobileWhoWeHelp({
    super.key, required this.image, required this.title, required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: ResponsiveMobileUtils.getResponsiveSize(context, 48),
          width: ResponsiveMobileUtils.getResponsiveSize(context, 48),
          decoration: BoxDecoration(
            color: Color(0xff010B06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            image,
            height: ResponsiveMobileUtils.getResponsiveSize(context, 30),
          ),
        ),
        SizedBox(
          height: ResponsiveMobileUtils.getResponsiveSize(context, 1),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 16),
              color: MyColor.white,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ResponsiveMobileUtils.getResponsiveSize(context, 4),
        ),
        SizedBox(
            width: ResponsiveMobileUtils.getResponsiveSize(context, 308),
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                  fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                  color: MyColor.grey,
                  fontWeight: FontWeight.normal),
            )),
      ],
    );
  }
}