import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class MobileOurFirmAndOther extends StatelessWidget {
   const MobileOurFirmAndOther({
    super.key,
    required this.image,
    required this.title,
    required this.description, required this.gradientColors, 
  });
  final String image;
  final String title;
  final String description;
  final List<Color> gradientColors;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveMobileUtils.getResponsiveSize(context, 420),
      width: ResponsiveMobileUtils.getResponsiveSize(context, 378),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            ResponsiveMobileUtils.getResponsiveSize(context, 24)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors// انتخاب رنگ گرادیانت
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 15),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(
                ResponsiveMobileUtils.getResponsiveSize(context, 16)),
            child: Image.asset(
              image,
              width: ResponsiveMobileUtils.getResponsiveSize(context, 345),
              height: ResponsiveMobileUtils.getResponsiveSize(context, 230),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 11),
          ),
          SizedBox(
            width: ResponsiveMobileUtils.getResponsiveSize(context, 378),
            child: Padding(
              padding: EdgeInsets.only(
                  left: ResponsiveMobileUtils.getResponsiveSize(context, 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: ResponsiveMobileUtils.getResponsiveSize(
                            context, 18),
                        color: MyColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ResponsiveMobileUtils.getResponsiveSize(context, 8),
                  ),
                  SizedBox(
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 337),
                    child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                        style: TextStyle(
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context,
                              12,
                            ),
                            color: MyColor.grey),
                        description),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 14),
          ),
          
        ],
      ),
    );
  }
}
