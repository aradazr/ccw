import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
              indent: size.width / 10,
              thickness: 1,
              color: MyColor.white,
              endIndent: size.width / 10,
            ),
            SizedBox(
              height: size.width/12.1,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ccwLogo.png',
                      height: size.width/51.42,
                      fit: BoxFit.cover,
                    ),
                     SizedBox(
                      height: size.width/51.42,
                    ),
                    SizedBox(
                      width: size.width/9,
                      child: Text(
                        'Build by aradazr.dev, All Rights Reserved',
                        style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width/90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width/45,
                    ),
                    Row(
                      spacing: size.width/240,
                      children: [
                        Container(
                          height: size.width/34.28,
                          width: size.width/34.28,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: size.width/34.28,
                          width: size.width/34.28,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: size.width/34.28,
                          width: size.width/34.28,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: size.width/34.28,
                          width: size.width/34.28,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width / 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width/80,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: size.width/46.45,
                    ),
                    Text(
                      'Documentation',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width/90,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: size.width/60,
                    ),
                    Text(
                      'License',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width/90,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: size.width/60,
                    ),
                    Text(
                      'Changelog',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width/90,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('See us on Google Map:',
                    style: TextStyle(
                      color: MyColor.white,
                      fontSize: size.width/90,
                    )),
                SizedBox(
                  height: size.width/720,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/map.png',
                    height: size.width/4.66
                    //  size.width > 769 ?  350  : size.width <769? 180 :  ,
                   , width: size.width /2.14,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
              height: size.width/19.72,
            ),
            Container(
              alignment: Alignment.center,
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 59),
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 59),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff000000),
                  Color(0xff081A1A),
                ]),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/cLogo.png',
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 25),
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 25),
              
              ),
            ),
            SizedBox(
              height: size.width/60,
            ),
            Text(
              'Copyright © 2019. Crafted with love.',
              style: TextStyle(
                color: MyColor.white,
                fontSize: size.width/90,
              ),
            ),
            SizedBox(
              height: size.width/13.98,
            )
      ],
    );
  }
}