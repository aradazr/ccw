import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class OurFirmAndOther extends StatelessWidget {
  const OurFirmAndOther({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.colors,
  });

  final Size size;
  final String title;
  final String description;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width / 1.109,
      height: size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width / 32.72),
        gradient: LinearGradient(
          colors: colors
        ),
      ),
      child: 
          
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
                width: size.width / 1.3,
                child: Text(
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
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
              
            ],
          ),
        
          
        
    );
  }
}
