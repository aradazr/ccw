import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class OurFirmAndOther extends StatelessWidget {
  const OurFirmAndOther({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.image,
    required this.colors,
  });

  final Size size;
  final String title;
  final String description;
  final String image;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width / 1.109,
      height: size.width / 2.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width / 32.72),
        gradient: LinearGradient(
          colors: colors
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 22.153,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: size.width / 40,
                    color: MyColor.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width / 53.33,
              ),
              SizedBox(
                width: size.width / 3.144,
                child: Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: size.width / 80,
                    color: MyColor.grey,
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 53.33,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: size.width / 9.53,
                    height: size.width / 30,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(2000),
                      border: Border.all(
                        width: 2,
                        color: Colors
                            .transparent, // خود border رنگ نمی‌دیم چون می‌خوایم gradient بشه
                      ),
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xffE3C985), Color(0xffA69464)],
                      ).createShader(bounds),
                      child: Container(
                        width: size.width / 9.53,
                        height: size.width / 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2000),
                          border: Border.all(
                            width: 2,
                            color: Colors.white, // این رنگ میره زیر gradient
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffE3C985),
                            Color(0xffA69464)
                          ], // رنگ‌های گرادیانت برای تکست
                        ).createShader(bounds),
                        child: Text(
                          'Learn More',
                          style: TextStyle(
                              fontSize: size.width / 90,
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: size.width / 22.3,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width / 65.45),
            child: Image.asset(
              'assets/images/ourFirm.png',
              height: size.width / 3.157,
              width: size.width / 2.102,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
