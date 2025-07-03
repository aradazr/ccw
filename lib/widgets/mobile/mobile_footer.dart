import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ccwLogo.png',
                      fit: BoxFit.cover,
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 17),
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 44),
                    ),
                    SizedBox(
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 7),
                    ),
                    SizedBox(
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 200),
                      child: Text(
                        'Build by aradazr.dev, All Rights Reserved',
                        style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 12),
                          color: MyColor.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveMobileUtils.getResponsiveSize(
                        context,
                        26,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(
                  context,
                  7,
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Social',
                      style: TextStyle(
                        fontSize: ResponsiveMobileUtils.getResponsiveSize(
                            context, 15),
                        color: MyColor.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 7),
                    ),
                    Row(
                      spacing:
                          ResponsiveMobileUtils.getResponsiveSize(context, 7),
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
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 12),
                            ),
                            decoration: BoxDecoration(
                              color: MyColor.cartColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/images/instagram.png',
                                fit: BoxFit.cover,
                                height: ResponsiveMobileUtils.getResponsiveSize(
                                    context, 22),
                                width: ResponsiveMobileUtils.getResponsiveSize(
                                    context, 22)),
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
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 12),
                            ),
                            decoration: BoxDecoration(
                              color: MyColor.cartColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/linkedin.png',
                              fit: BoxFit.cover,
                              height: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 22),
                              width: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 45),
          ),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(
                  'https://www.google.com/maps/place/CCW+CPA/@49.2636573,-123.1181345,17z/data=!3m2!4b1!5s0x548673c4e9f2c619:0xa5b3b9ac91c84655!4m6!3m5!1s0x548673ec3a23f9c1:0xf186078e01a09075!8m2!3d49.2636573!4d-123.1181345!16s%2Fg%2F11lzkr22gx?entry=ttu&g_ep=EgoyMDI1MDYyMy4yIKXMDSoASAFQAw%3D%3D');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch');
              }
            },
            child: Image.asset(
              'assets/images/map.png',
              fit: BoxFit.fitHeight,
              height: ResponsiveMobileUtils.getResponsiveSize(context, 300),
              width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
            ),
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 16),
          ),
          Container(
            alignment: Alignment.center,
            height: ResponsiveMobileUtils.getResponsiveSize(context, 42),
            width: ResponsiveMobileUtils.getResponsiveSize(context, 42),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff000000),
                Color(0xff081A1A),
              ]),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/cLogo.png',
              height: ResponsiveMobileUtils.getResponsiveSize(context, 19),
              width: ResponsiveMobileUtils.getResponsiveSize(context, 14.74),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 12),
          ),
          Text(
            'Copyright © 2019. Crafted with love.',
            style: TextStyle(
              color: MyColor.white,
              fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12),
            ),
          ),
          SizedBox(
            height: ResponsiveMobileUtils.getResponsiveSize(context, 50),
          ),
        ],
      ),
    );
  }
}
