import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    required this.size,
    required this.homeStyle,
    required this.aboutStyle,
    required this.servicesStyle,
    required this.resourcesStyle,
    required this.contactStyle,
  });

  final Size size;

  // استایل هر متن به صورت پارامتر
  final TextStyle homeStyle;
  final TextStyle aboutStyle;
  final TextStyle servicesStyle;
  final TextStyle resourcesStyle;
  final TextStyle contactStyle;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 49),
      child: Row(
        children: [
          SizedBox(width:size.width / 18.7),
          Image.asset(
            'assets/images/ccwLogo.png',
            width: size.width / 18.7,
            height:size.width / 49.65 ,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width:  size.width / 2.3
                
          ),
          Row(
            children: [
              Text('Home', style: homeStyle),
              SizedBox(width: size.width / 60),
              Text('About Us', style: aboutStyle),
              SizedBox(width: size.width /60),
              Text('Services', style: servicesStyle),
              SizedBox(width: size.width /60),
              Text('Resources', style: resourcesStyle),
              SizedBox(width: size.width /60),
              Text('Contact Us', style: contactStyle),
              SizedBox(width: size.width /60),
              Container(
                alignment: Alignment.center,
                width: size.width/ 10.99,
                height: size.width/30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: MyColor.linear),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  'Client Portal',
                  style: TextStyle(
                      fontSize: size.width/90,
                      color: MyColor.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(width: size.width / 36),
            ],
          ),
          
        ],
      ),
    );
  }
}