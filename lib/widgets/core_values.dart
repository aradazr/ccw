import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class CoreValues extends StatelessWidget {
  const CoreValues({
    super.key,
    required this.size, required this.title, required this.description, required this.image,
  });

  final Size size;
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
          height: size.width / 5.169 +
              size.width / 240, // کمی بزرگ‌تر برای نمایش بوردر
          width: size.width / 2.9 + size.width / 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                size.width / 26.18), // کمی بزرگ‌تر از کانتینر اصلی
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
            margin: EdgeInsets.all(1), // ضخامت بوردر
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(size.width / 26.18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff111111), Color(0xff081A1A)],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size.width / 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: size.width / 120,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: size.width / 205.71),
                        child: Image.asset(
                          image,
                          height: size.width / 32,
                          width: size.width / 32,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 288,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        title,
                        style: TextStyle(
                            fontSize: size.width / 60,
                            fontWeight: FontWeight.bold,
                            color: MyColor.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width / 3.5,
                    height: size.width / 10.317,
                    child: Text(
                      textAlign: TextAlign.start,
                      description,
                      style: TextStyle(
                          fontSize: size.width / 70.76,
                          height: 2.2,
                          fontWeight: FontWeight.w100,
                          color: MyColor.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    
        // قرار دادن تصویر روی لبه کانتینر
      ],
    );
  }
}