import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:flutter/material.dart';

class MobileResourcesContainer extends StatelessWidget {
  const MobileResourcesContainer({
    super.key,
    required this.file,
  });

  final PdfItem file;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveMobileUtils
          .getResponsiveSize(context, 64),
      width: ResponsiveMobileUtils
          .getResponsiveSize(context, 371),
      decoration: BoxDecoration(
        color: MyColor.cartColor,
        borderRadius: BorderRadius.circular(
          ResponsiveMobileUtils
              .getResponsiveSize(
                  context, 8),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ResponsiveMobileUtils
                .getResponsiveSize(
                    context, 320),
            child: Text(
              file.name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              style: TextStyle(
                fontSize:
                    ResponsiveMobileUtils
                        .getResponsiveSize(
                            context, 14),
                color: MyColor.grey,
              ),
            ),
          ),
          Image.asset(
            'assets/images/goldArrow.png',
            height: ResponsiveMobileUtils
                .getResponsiveSize(
                    context, 24),
            width: ResponsiveMobileUtils
                .getResponsiveSize(
                    context, 24),
          )
        ],
      ),
    );
  }
}