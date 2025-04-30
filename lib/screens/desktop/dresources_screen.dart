import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/desktop/app_bar.dart';
import 'package:flutter/material.dart';

class DresourcesScreen extends StatelessWidget {
  const DresourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 583),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/recources.png',
                    height:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 583),
                    width:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    child: MyAppbar(
                      size: size,
                      homeStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      aboutStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      servicesStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      resourcesStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          decorationColor: MyColor.primary,
                          fontSize: size.width / 90,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w200),
                      contactStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Positioned(
                    top: ResponsiveDesktopUtils.getResponsiveSize(context, 230),
                    child: Column(
                      spacing:
                          ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                      children: [
                        Text(
                          'Resources',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveDesktopUtils.getResponsiveSize(
                                      context, 48),
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 555),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Find the information you need with our comprehensive resources for individuals and businesses.',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 24),
                                color: MyColor.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 103),
            ),
            Column(
              spacing: ResponsiveDesktopUtils.getResponsiveSize(context, 16),
              children: [
                Text(
                  'Accounting and Business Resources Online',
                  style: TextStyle(
                      fontSize:
                          ResponsiveDesktopUtils.getResponsiveSize(context, 36),
                      color: MyColor.secendry,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: ResponsiveDesktopUtils.getResponsiveSize(context, 769),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Have questions? Our professional accountants and business advisors are here to assist you.',
                    style: TextStyle(
                        fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 24),
                        color: MyColor.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 1),
            ),
            ListView.builder(
              
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(top:  ResponsiveDesktopUtils.getResponsiveSize(context, 96)),
                  child: Column(
                    spacing: ResponsiveDesktopUtils.getResponsiveSize(context, 32),
                    children: [
                     Text(
                    'Title',
                    style: TextStyle(
                        fontSize:
                            ResponsiveDesktopUtils.getResponsiveSize(context, 32),
                        color: MyColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    children: [
                      Container(
                        height: ResponsiveDesktopUtils.getResponsiveSize(context, 64),
                        width: ResponsiveDesktopUtils.getResponsiveSize(context, 371),
                        decoration: BoxDecoration(
                          color: MyColor.cartColor,
                          borderRadius: BorderRadius.circular(ResponsiveDesktopUtils.getResponsiveSize(context, 8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: ResponsiveDesktopUtils.getResponsiveSize(context, 300),
                              child: Text('description', style: TextStyle(
                                fontSize: ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                                color: MyColor.grey,
                                fontWeight: FontWeight.normal
                              ),),
                            ),
                            Image.asset('assets/images/goldArrow.png',
                            height:  ResponsiveDesktopUtils.getResponsiveSize(context, 24),
                            width: ResponsiveDesktopUtils.getResponsiveSize(context, 24),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
