import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class DesktopBulletText extends StatelessWidget {
  final String text;
  const DesktopBulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
 
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    
    
   SizedBox(
  width: ResponsiveDesktopUtils.getResponsiveSize(context, 470),
  
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: '• ',
          style: TextStyle(
            color: MyColor.secendry, // رنگ نقطه قرمز
            fontSize: ResponsiveDesktopUtils.getResponsiveSize(context, 20),
            fontWeight: FontWeight.w200,
          ),
        ),
        TextSpan(
          text: text,
          style: TextStyle(
            color: MyColor.grey,
            fontSize: ResponsiveDesktopUtils.getResponsiveSize(context, 16),
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    ),
  ),
),
  ],
);
  }
}