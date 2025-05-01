import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:flutter/material.dart';

class ResourcesContainer extends StatelessWidget {
  const ResourcesContainer({
    super.key,
    required this.file,
  });

  final PdfItem file;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveDesktopUtils
          .getResponsiveSize(context, 64),
      width: ResponsiveDesktopUtils
          .getResponsiveSize(context, 371),
      decoration: BoxDecoration(
        color: MyColor.cartColor,
        borderRadius: BorderRadius.circular(
          ResponsiveDesktopUtils
              .getResponsiveSize(
                  context, 8),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ResponsiveDesktopUtils
                .getResponsiveSize(
                    context, 320),
            child: Text(
              file.name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              style: TextStyle(
                fontSize:
                    ResponsiveDesktopUtils
                        .getResponsiveSize(
                            context, 15),
                color: MyColor.grey,
              ),
            ),
          ),
          Image.asset(
            'assets/images/goldArrow.png',
            height: ResponsiveDesktopUtils
                .getResponsiveSize(
                    context, 24),
            width: ResponsiveDesktopUtils
                .getResponsiveSize(
                    context, 24),
          )
        ],
      ),
    );
  }
}