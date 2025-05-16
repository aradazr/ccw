import 'dart:async';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/screens/desktop/dhome_screen.dart';
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
  double _progress = 0.0;
  final List<String> imageAssets = [
    'assets/images/aboutusPeople.png',
    'assets/images/accounting.png',
    'assets/images/advisory.png',
    'assets/images/arrow.png',
    'assets/images/arrowDown.png',
    'assets/images/call.png',
    'assets/images/ccwLogo.png',
    'assets/images/circularArrow.png',
    'assets/images/clientFocused.png',
    'assets/images/cLogo.png',
    'assets/images/closeDrawer.png',
    'assets/images/commitment.png',
    'assets/images/compliance.png',
    'assets/images/corporate.png',
    'assets/images/curvShape.png',
    'assets/images/decadesIcon.png',
    'assets/images/dservices.png',
    'assets/images/email.png',
    'assets/images/excellence.png',
    'assets/images/expertAccounting.png',
    'assets/images/eyeIcon.png',
    'assets/images/flyingLetter.png',
    'assets/images/goldArrow.png',
    'assets/images/greenBlur.png',
    'assets/images/greenBlur2.png',
    'assets/images/greyBlur.png',
    'assets/images/individualIcon.png',
    'assets/images/leadership.png',
    'assets/images/location.png',
    'assets/images/map.png',
    'assets/images/menu.png',
    'assets/images/mobileAboutUsPeople.png',
    'assets/images/mobileMap.png',
    'assets/images/mobileResources.png',
    'assets/images/mobileSpace.png',
    'assets/images/operationIcon.png',
    'assets/images/ourFirm.png',
    'assets/images/ownerIcon.png',
    'assets/images/parham.png',
    'assets/images/colette.png',
    'assets/images/brian.png',
    'assets/images/kantaro.png',
    'assets/images/peapole.png',
    'assets/images/personal.png',
    'assets/images/personalized.png',
    'assets/images/realState.png',
    'assets/images/recources.png',
    'assets/images/refresh.png',
    'assets/images/reliableService.png',
    'assets/images/seamless.png',
    'assets/images/selfEmploydIcon.png',
    'assets/images/services.png',
    'assets/images/smallIcon.png',
    'assets/images/smoothConnectivity.png',
    'assets/images/space.png',
    'assets/images/trust.png',
  ];

  @override
  void initState() {
    super.initState();
    _prepareApp();
  }

  Future<void> _prepareApp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _precacheImagesWithProgress();
    await _checkConnectionAndNavigate();
  }

  Future<void> _precacheImagesWithProgress() async {
    for (int i = 0; i < imageAssets.length; i++) {
      await precacheImage(AssetImage(imageAssets[i]), context);
      setState(() {
        _progress = (i + 1) / imageAssets.length;
      });
    }
  }

  Future<void> _checkConnectionAndNavigate() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool connected = connectivityResult != ConnectivityResult.none;

    if (connected) {
      double width = MediaQuery.of(context).size.width;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              width >= 650 ? const DhomeScreen() : const MhomeScreen(),
        ),
      );
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
              Image.asset(
                'assets/images/ccwLogo.png',
                height: size.width < 650
                    ? ResponsiveMobileUtils.getResponsiveSize(context, 72)
                    : ResponsiveDesktopUtils.getResponsiveSize(context, 72),
                width: size.width < 650
                    ? ResponsiveMobileUtils.getResponsiveSize(context, 191)
                    : ResponsiveDesktopUtils.getResponsiveSize(context, 191),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 20),
              ),
              Padding(
                padding: size.width < 650
                    ? EdgeInsets.symmetric(
                        horizontal: ResponsiveMobileUtils.getResponsiveSize(
                            context, 100))
                    : EdgeInsets.symmetric(
                        horizontal: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 500)),
                child: LinearProgressIndicator(
                  value: _progress,
                  color: MyColor.primary,
                  backgroundColor: Colors.white24,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(
                      ResponsiveDesktopUtils.getResponsiveSize(context, 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
