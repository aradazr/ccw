import 'package:ccw/screens/desktop/dcontact_us_screen.dart';
import 'package:ccw/screens/desktop/dabout_us_screen.dart';
import 'package:ccw/screens/desktop/dresources_screen.dart';
import 'package:ccw/screens/desktop/dservices_screen.dart';
import 'package:ccw/screens/desktop/meet_our_experts.dart';
import 'package:ccw/screens/desktop/test.dart';
import 'package:ccw/screens/mobile/mabout_us_screen.dart';
import 'package:ccw/screens/mobile/mhome_screen.dart';
import 'package:ccw/screens/mobile/mmeet_our_expert_screen.dart';
import 'package:ccw/screens/mobile/mobile_drawer_screen.dart';
import 'package:ccw/screens/mobile/mrecources_screen.dart';
import 'package:ccw/screens/mobile/mservices_screen.dart';
import 'package:ccw/screens/msplash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ccw',
      theme: ThemeData(
        fontFamily: 'inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:  DcontactUsScreen(),
    );
  }
}
