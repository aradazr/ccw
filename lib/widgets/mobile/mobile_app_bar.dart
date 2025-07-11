import 'package:ccw/constans/responsive_utiles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ResponsiveMobileUtils.getResponsiveSize(context, 27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ccwLogo.png',
            height: ResponsiveMobileUtils.getResponsiveSize(context, 26),
            width: ResponsiveMobileUtils.getResponsiveSize(context, 69),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: ResponsiveMobileUtils.getResponsiveSize(context, 265.97),
          ),
                      GestureDetector(
            onTap: () => context.go('/mobile-drawer'),
            child: Image.asset(
              'assets/images/menu.png',
              width: ResponsiveMobileUtils.getResponsiveSize(context, 24),
              height: ResponsiveMobileUtils.getResponsiveSize(context, 24),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
