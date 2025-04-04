import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class MobileCoreValues extends StatelessWidget {
  const MobileCoreValues({
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
          alignment: Alignment.center,
          height: ResponsiveMobileUtils.getResponsiveSize(
              context, 170), // کمی بزرگ‌تر برای نمایش بوردر
          width: ResponsiveMobileUtils.getResponsiveSize(context, 370),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                ResponsiveMobileUtils.getResponsiveSize(
                    context, 24)), // کمی بزرگ‌تر از کانتینر اصلی
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
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
            margin: EdgeInsets.all(ResponsiveMobileUtils.getResponsiveSize(
                context, 1)), // ضخامت بوردر
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  ResponsiveMobileUtils.getResponsiveSize(context, 24)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff111111), Color(0xff081A1A)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: ResponsiveMobileUtils.getResponsiveSize(context, 40),
                      width: ResponsiveMobileUtils.getResponsiveSize(context, 40),
                    ),
                    SizedBox(
                      height: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      title,
                      style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                          fontWeight: FontWeight.bold,
                          color: MyColor.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 6),
                ),
                SizedBox(
                  width:ResponsiveMobileUtils.getResponsiveSize(context, 260),
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 57),
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
      ],
    );
  }
}
