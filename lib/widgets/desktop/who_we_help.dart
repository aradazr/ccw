import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class WhoWeHelp extends StatelessWidget {
  const WhoWeHelp({
    super.key,
    required this.size, required this.image, required this.title, required this.description,
  });

  final Size size;
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
          height: size.width/24,
          width: size.width/24,
          decoration: BoxDecoration(
            color: Color(0xff010B06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            image,
            height: size.width/32.72,
          ),
        ),
        SizedBox(
          height: size.width/45,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: size.width/72,
              color: MyColor.white,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.width/90,
        ),
        SizedBox(
            width: size.width / 3.8,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                  fontSize: size.width/90,
                  color: MyColor.grey,
                  fontWeight: FontWeight.normal),
            )),
      ],
    );
  }
}