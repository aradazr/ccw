import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class MdrawerScreen extends StatelessWidget {
  const MdrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: Padding(
        padding: EdgeInsets.only(
          left: ResponsiveMobileUtils.getResponsiveSize(context, 28),
          right: ResponsiveMobileUtils.getResponsiveSize(context, 28),
          top: ResponsiveMobileUtils.getResponsiveSize(context, 50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: ResponsiveMobileUtils.getResponsiveSize(context, 402)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/ccwLogo.png',
                  width: ResponsiveMobileUtils.getResponsiveSize(context, 68),
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 24),
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Image.asset(
                    'assets/images/closeDrawer.png',
                    width: ResponsiveMobileUtils.getResponsiveSize(context, 30),
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 30),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              spacing: ResponsiveMobileUtils.getResponsiveSize(context, 30),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 402)),
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize:
                          ResponsiveMobileUtils.getResponsiveSize(context, 20),
                      fontWeight: FontWeight.w200,
                      color: MyColor.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/about-us'),
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize:
                          ResponsiveMobileUtils.getResponsiveSize(context, 20),
                      fontWeight: FontWeight.w200,
                      color: MyColor.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/services'),
                  child: Text(
                    'Services',
                    style: TextStyle(
                      fontSize:
                          ResponsiveMobileUtils.getResponsiveSize(context, 20),
                      fontWeight: FontWeight.w200,
                      color: MyColor.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/resources'),
                  child: Text(
                    'Resources',
                    style: TextStyle(
                      fontSize:
                          ResponsiveMobileUtils.getResponsiveSize(context, 20),
                      fontWeight: FontWeight.w200,
                      color: MyColor.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/contact-us'),
                  child: Text(
                    'Contact US',
                    style: TextStyle(
                      fontSize:
                          ResponsiveMobileUtils.getResponsiveSize(context, 20),
                      fontWeight: FontWeight.w200,
                      color: MyColor.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://ccw.myonlinebookkeeping.com');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 148),
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 40),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: MyColor.linear),
                        borderRadius: BorderRadius.circular(
                            ResponsiveMobileUtils.getResponsiveSize(
                                context, 14))),
                    child: Text(
                      'Client Portal',
                      style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 15),
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
