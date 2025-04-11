import 'dart:async';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/screens/desktop/dhome_screen.dart'; // ایمپورت صفحه دسکتاپ
import 'package:ccw/screens/mobile/mhome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    await Future.delayed(const Duration(seconds: 2)); // برای نمایش لوگو و لودینگ

    var connectivityResult = await Connectivity().checkConnectivity();
    bool connected = connectivityResult != ConnectivityResult.none;

    if (connected) {
      double width = MediaQuery.of(context).size.width;
      if (width >= 650) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DhomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MhomeScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('اتصال به اینترنت برقرار نیست.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Color(0xff081A1A),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Image.asset(
                  'assets/images/ccwLogo.png',
                  height: size.width < 650
                      ? ResponsiveMobileUtils.getResponsiveSize(context, 72)
                      : ResponsiveDesktopUtils.getResponsiveSize(context, 72),
                  width: size.width < 650
                      ? ResponsiveMobileUtils.getResponsiveSize(context, 191)
                      : ResponsiveDesktopUtils.getResponsiveSize(context, 191),
                ),
              ),
              SizedBox(
                height: size.width < 650
                    ? ResponsiveMobileUtils.getResponsiveSize(context, 15)
                    : ResponsiveDesktopUtils.getResponsiveSize(context, 30),
              ),
              SpinKitThreeBounce(
                color: MyColor.primary,
                size: size.width < 650
                    ? ResponsiveMobileUtils.getResponsiveSize(context, 25)
                    : ResponsiveDesktopUtils.getResponsiveSize(context, 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}