import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text('• ', style: TextStyle(
          color: MyColor.secendry,
          fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 13))),
        SizedBox(
          width: ResponsiveMobileUtils.getResponsiveSize(context, 338),
          child: Text(
            text,
            style:  TextStyle(
              fontWeight: FontWeight.w200 ,
              color: MyColor.grey,
              fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12.5)),
          ),
        ),
      ],
    );
  }
}