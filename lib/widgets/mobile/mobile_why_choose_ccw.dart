import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class MobileWhyChooseCcw extends StatelessWidget {
  const MobileWhyChooseCcw({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // جلوگیری از برش تصویر
      alignment: Alignment.topCenter,
      children: [
        // کانتینر برای بوردر گرادینت
        Container(
          height: ResponsiveMobileUtils.getResponsiveSize(context, 156)+ 6, // کمی بزرگ‌تر برای نمایش بوردر
          width: ResponsiveMobileUtils.getResponsiveSize(context, 370) + 6,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(ResponsiveMobileUtils.getResponsiveSize(context, 24)), // کمی بزرگ‌تر از کانتینر اصلی
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff051D12),
                Color(0xff051D12),
                Color(0xff051D12),
                Color(0xff051D12),
                Color(0xff008042),
              ],
            ),
          ),
        ),

        // کانتینر اصلی بدون تغییر
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.all(1.5), // ضخامت بوردر
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ResponsiveMobileUtils.getResponsiveSize(context, 24)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff111111), Color(0xff081A1A)],
              ),
            ),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ResponsiveMobileUtils.getResponsiveSize(context, 300),
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                        fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: MyColor.white),
                  ),
                ),
                SizedBox(
                  width: ResponsiveMobileUtils.getResponsiveSize(context, 300),
                  child: Text(
                    textAlign: TextAlign.center,
                    description,
                    style: TextStyle(
                        fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                        fontWeight: FontWeight.w100,
                        color: MyColor.grey),
                  ),
                ),
              ],
            ),
          ),
        ),

        // قرار دادن تصویر روی لبه کانتینر
        Positioned(
          top: -ResponsiveMobileUtils.getResponsiveSize(context, 25), // تصویر را بالاتر از کانتینر قرار می‌دهد
          child: Image.asset(
            image,
            height: ResponsiveMobileUtils.getResponsiveSize(context, 48),
          ),
        ),
      ],
    );
  }
}
