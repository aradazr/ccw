import 'package:ccw/constans/my_color.dart';
import 'package:flutter/material.dart';

class MeetOurTeam extends StatelessWidget {
  const MeetOurTeam({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    required this.title,
    required this.subTitle,
  });

  final Size size;
  final String image;
  final String name;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 5.070,
      width: size.width / 1.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width / 60),
        gradient: LinearGradient(
          colors: MyColor.cartServiceColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width / 45,
          ),
          Image.asset(
            image,
            width: size.width / 7.659,
            height: size.width / 7.659,
          ),
          SizedBox(
            width: size.width / 144,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: MyColor.white,
                    fontSize: size.width / 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width / 250,
              ),
              Text(
                title,
                style: TextStyle(
                    color: MyColor.subTitle,
                    fontSize: size.width / 60,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: size.width / 180,
              ),
              SizedBox(
                  width: size.width / 1.399,
                  child: Text(
                    style: TextStyle(
                      height: 1.5,
                      color: MyColor.grey,
                      fontSize: size.width / 95,
                    ),
                    subTitle,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
