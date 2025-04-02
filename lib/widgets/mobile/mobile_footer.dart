import 'dart:ui';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';

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
                  left: ResponsiveMobileUtils.getResponsiveSize(
                      context, 16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ccwLogo.png',
                      fit: BoxFit.cover,
                      height: ResponsiveMobileUtils.getResponsiveSize(
                          context, 17),
                      width: ResponsiveMobileUtils.getResponsiveSize(
                          context, 44),
                    ),
                    SizedBox(
                      height: ResponsiveMobileUtils.getResponsiveSize(
                          context, 7),
                    ),
                    SizedBox(
                      width: ResponsiveMobileUtils.getResponsiveSize(
                          context, 200),
                      child: Text(
                        'Build by aradazr.dev, All Rights Reserved',
                        style: TextStyle(
                          fontSize:
                              ResponsiveMobileUtils.getResponsiveSize(
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
                    left: ResponsiveMobileUtils.getResponsiveSize(
                        context, 16)),
                child: Column(
                  spacing: ResponsiveMobileUtils.getResponsiveSize(
                      context, 12),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 15),
                        color: MyColor.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Documentation',
                      style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 12),
                        color: MyColor.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      'License',
                      style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 12),
                        color: MyColor.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      'Changelog',
                      style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 12),
                        color: MyColor.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(
                  context,
                  33,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveMobileUtils.getResponsiveSize(
                      context, 16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Social',
                      style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 15),
                        color: MyColor.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveMobileUtils.getResponsiveSize(
                          context, 7),
                    ),
                    Row(
                      spacing: ResponsiveMobileUtils.getResponsiveSize(
                          context, 7),
                      children: [
                        Container(
                          height:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          width:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          decoration: BoxDecoration(
                            color: MyColor.secendry,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          width:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          decoration: BoxDecoration(
                            color: MyColor.secendry,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          width:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          decoration: BoxDecoration(
                            color: MyColor.secendry,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          width:
                              ResponsiveMobileUtils.getResponsiveSize(
                                  context, 32),
                          decoration: BoxDecoration(
                            color: MyColor.secendry,
                            shape: BoxShape.circle,
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
            height:
                ResponsiveMobileUtils.getResponsiveSize(context, 45),
          ),
          Image.asset(
            'assets/images/mobileMap.png',
            fit: BoxFit.cover,
            height:
                ResponsiveMobileUtils.getResponsiveSize(context, 454),
            width:
                ResponsiveMobileUtils.getResponsiveSize(context, 402),
          ),
          SizedBox(
            height:
                ResponsiveMobileUtils.getResponsiveSize(context, 16),
          ),
          Container(
            alignment: Alignment.center,
            height:
                ResponsiveMobileUtils.getResponsiveSize(context, 42),
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
              height:
                  ResponsiveMobileUtils.getResponsiveSize(context, 19),
              width: ResponsiveMobileUtils.getResponsiveSize(
                  context, 14.74),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height:
                ResponsiveMobileUtils.getResponsiveSize(context, 12),
          ),
          Text(
            'Copyright © 2019. Crafted with love.',
            style: TextStyle(
              color: MyColor.white,
              fontSize:
                  ResponsiveMobileUtils.getResponsiveSize(context, 12),
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