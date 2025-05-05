import 'package:flutter/material.dart';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';

class MobileCompanyMember extends StatefulWidget {
  const MobileCompanyMember({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.description,
    required this.onExpand,
  });

  final String image;
  final String name;
  final String title;
  final String description;
  final Function(bool) onExpand; 

  @override
  State<MobileCompanyMember> createState() => _MobileCompanyMemberState();
}

class _MobileCompanyMemberState extends State<MobileCompanyMember> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded
          ? ResponsiveMobileUtils.getResponsiveSize(context, 305) // ارتفاع باز شده
          : ResponsiveMobileUtils.getResponsiveSize(context, 88), // ارتفاع بسته
      width: ResponsiveMobileUtils.getResponsiveSize(context, 365),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            ResponsiveMobileUtils.getResponsiveSize(context, 24)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: MyColor.cartServiceColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                    right: ResponsiveMobileUtils.getResponsiveSize(context, 12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      ResponsiveMobileUtils.getResponsiveSize(context, 12)),
                  child: Image.asset(
                    widget.image,
                    height: ResponsiveMobileUtils.getResponsiveSize(context, 64),
                    width: ResponsiveMobileUtils.getResponsiveSize(context, 64),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveMobileUtils.getResponsiveSize(context, 155),
                child: Padding(
                  padding:  EdgeInsets.only(top:ResponsiveMobileUtils.getResponsiveSize(context, 25) ),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: MyColor.white,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 14),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: ResponsiveMobileUtils.getResponsiveSize(context, 4),
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: MyColor.subTitle,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                  widget.onExpand(isExpanded);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 25),
                    left: ResponsiveMobileUtils.getResponsiveSize(context, 80),
                  ),
                  child: AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: isExpanded ? 0.5 : 0, // چرخش فلش هنگام باز و بسته شدن
                    child: Image.asset(
                      'assets/images/arrowDown.png',
                      height: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                      width: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isExpanded)

          SizedBox(
            width:  ResponsiveMobileUtils.getResponsiveSize(context, 341),
            child: Padding(
              padding:  EdgeInsets.only(top: ResponsiveMobileUtils.getResponsiveSize(context, 12)),
              child: Text(
                
                overflow: TextOverflow.ellipsis,
                maxLines: 12,
                style: TextStyle(
                  color: MyColor.grey,
                  fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                ) , 
                textAlign: TextAlign.left,
                widget.description
                ),
            ),
          )
        ],
      ),
    );
  }
}