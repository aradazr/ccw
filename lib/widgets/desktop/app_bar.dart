import 'package:ccw/constans/my_color.dart';
import 'package:ccw/screens/desktop/dabout_us_screen.dart';
import 'package:ccw/screens/desktop/dhome_screen.dart';
import 'package:ccw/screens/desktop/dresources_screen.dart';
import 'package:ccw/screens/desktop/dservices_screen.dart';
import 'package:ccw/screens/desktop/dcontact_us_screen.dart';
import 'package:ccw/widgets/desktop/hover_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

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
          SizedBox(width: size.width / 18.7),
          Image.asset(
            'assets/images/ccwLogo.png',
            width: size.width / 18.7,
            height: size.width / 49.65,
            fit: BoxFit.cover,
          ),
          SizedBox(width: size.width / 2.3),
          Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DhomeScreen())),
                  child: HoverText(text: 'Home', defaultStyle: homeStyle)),
              SizedBox(width: size.width / 60),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DaboutUsScreen())),
                child: HoverText(text: 'About Us', defaultStyle: aboutStyle),
              ),
              SizedBox(width: size.width / 60),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DservicesScreen())),
                child: HoverText(text: 'Services', defaultStyle: servicesStyle),
              ),
              SizedBox(width: size.width / 60),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  DresourcesScreen(),
                  ),
                ),
                child:
                    HoverText(text: 'Resources', defaultStyle: resourcesStyle),
              ),
              SizedBox(width: size.width / 60),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DcontactUsScreen())),
                  child: HoverText(
                      text: 'Contact Us', defaultStyle: contactStyle)),
              SizedBox(width: size.width / 60),
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
                  width: size.width / 10.99,
                  height: size.width / 30,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: MyColor.linear),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Client Portal',
                    style: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                  ),
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
