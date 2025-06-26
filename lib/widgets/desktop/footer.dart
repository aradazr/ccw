import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          height: size.width / 12.1,
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
                      height: size.width / 51.42,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: size.width / 51.42,
                    ),
                    SizedBox(
                      width: size.width / 9,
                      child: Text(
                        'Build by aradazr.dev, All Rights Reserved',
                        style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width / 90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width / 45,
                    ),
                    Row(
                      spacing: size.width / 240,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final Uri url =
                                Uri.parse('https://www.instagram.com/ccwcpa/');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch');
                            }
                          },
                          child: Container(
                             padding: EdgeInsets.all(
                              ResponsiveDesktopUtils.getResponsiveSize(
                                  context, 12),
                            ),
                            height: size.width / 34.28,
                            width: size.width / 34.28,
                            decoration: BoxDecoration(
                              color: MyColor.cartColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/instagram.png',
                              fit: BoxFit.cover,
                             
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse(
                                'https://www.linkedin.com/company/ccw-cpa/');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                              ResponsiveDesktopUtils.getResponsiveSize(
                                  context, 12),
                            ),
                            height: size.width / 34.28,
                            width: size.width / 34.28,
                            decoration: BoxDecoration(
                              color: MyColor.cartColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/linkedin.png',
                              fit: BoxFit.cover,
                              
                            ),
                          ),
                        ),
                      ],
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
                      fontSize: size.width / 90,
                    )),
                SizedBox(
                  height: size.width / 720,
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.google.com/maps/place/CCW+CPA/@49.2636573,-123.1181345,17z/data=!3m2!4b1!5s0x548673c4e9f2c619:0xa5b3b9ac91c84655!4m6!3m5!1s0x548673ec3a23f9c1:0xf186078e01a09075!8m2!3d49.2636573!4d-123.1181345!16s%2Fg%2F11lzkr22gx?entry=ttu&g_ep=EgoyMDI1MDYyMy4yIKXMDSoASAFQAw%3D%3D');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ResponsiveDesktopUtils.getResponsiveSize(context, 30),
                    ),
                    child: Image.asset(
                      'assets/images/map.png',
                      height: size.width / 4.66
                      //  size.width > 769 ?  350  : size.width <769? 180 :  ,
                      ,
                      width: size.width / 2.14,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: size.width / 19.72,
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
          child: Image.asset(
            'assets/images/cLogo.png',
            height: ResponsiveDesktopUtils.getResponsiveSize(context, 25),
            width: ResponsiveDesktopUtils.getResponsiveSize(context, 25),
          ),
        ),
        SizedBox(
          height: size.width / 60,
        ),
        Text(
          'Copyright © 2019. Crafted with love.',
          style: TextStyle(
            color: MyColor.white,
            fontSize: size.width / 90,
          ),
        ),
        SizedBox(
          height: size.width / 13.98,
        )
      ],
    );
  }
}
