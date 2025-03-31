 
import 'package:flutter/material.dart';

class ResponsiveMobileUtils {
  static const double baseWidth = 402;

  static double getResponsiveSize(BuildContext context, double designSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / baseWidth) * designSize;
  }
}