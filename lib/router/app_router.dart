import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ccw/screens/splash_screen.dart';
import 'package:ccw/screens/desktop/dhome_screen.dart';
import 'package:ccw/screens/desktop/dabout_us_screen.dart';
import 'package:ccw/screens/desktop/dservices_screen.dart';
import 'package:ccw/screens/desktop/dresources_screen.dart';
import 'package:ccw/screens/desktop/dcontact_us_screen.dart';
import 'package:ccw/screens/desktop/meet_our_experts.dart';
import 'package:ccw/screens/mobile/mhome_screen.dart';
import 'package:ccw/screens/mobile/mabout_us_screen.dart';
import 'package:ccw/screens/mobile/mservices_screen.dart';
import 'package:ccw/screens/mobile/mrecources_screen.dart';
import 'package:ccw/screens/mobile/mcontact_us_screen.dart';
import 'package:ccw/screens/mobile/mmeet_our_expert_screen.dart';
import 'package:ccw/screens/mobile/mobile_drawer_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650 ? const DhomeScreen() : const MhomeScreen();
        },
      ),
      GoRoute(
        path: '/about-us',
        name: 'about-us',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650 ? const DaboutUsScreen() : const MaboutUsScreen();
        },
      ),
      GoRoute(
        path: '/services',
        name: 'services',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650
              ? const DservicesScreen()
              : const MservicesScreen();
        },
      ),
      GoRoute(
        path: '/resources',
        name: 'resources',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650
              ? const DresourcesScreen()
              : const MrecourcesScreen();
        },
      ),
      GoRoute(
        path: '/contact-us',
        name: 'contact-us',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650
              ? const DcontactUsScreen()
              : const McontactUsScreen();
        },
      ),
      GoRoute(
        path: '/meet-our-experts',
        name: 'meet-our-experts',
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          return width >= 650
              ? const DmeetOurExperts()
              : const MmeetOurExpertScreen();
        },
      ),
      GoRoute(
        path: '/mobile-drawer',
        name: 'mobile-drawer',
        builder: (context, state) => const MdrawerScreen(),
      ),
    ],
  );
}
