import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 49),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 18.7,
          ),
          Image.asset(
            'assets/images/ccwLogo.png',
            width: size.width / 18.7,
          ),
          SizedBox(
            width: size.width / 2.3,
          ),
          Row(
            spacing: 24,
            children: [
              Text(
                'Home',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: MyColor.primary,
                    fontSize: 16,
                    color: MyColor.primary,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                'About Us',
                style: TextStyle(
                    fontSize: 16,
                    color: MyColor.white,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                'Services',
                style: TextStyle(
                    fontSize: 16,
                    color: MyColor.white,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                'Resources',
                style: TextStyle(
                    fontSize: 16,
                    color: MyColor.white,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 16,
                    color: MyColor.white,
                    fontWeight: FontWeight.w200),
              ),
              Container(
                alignment: Alignment.center,
                width: 131,
                height: 48,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: MyColor.linear),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  'Client Portal',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.white,
                      fontWeight: FontWeight.w200),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
