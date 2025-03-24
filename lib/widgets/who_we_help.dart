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
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: Color(0xff010B06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            image,
            height: 44,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              color: MyColor.white,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            width: size.width / 3.8,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                  fontSize: 16,
                  color: MyColor.grey,
                  fontWeight: FontWeight.normal),
            )),
      ],
    );
  }
}