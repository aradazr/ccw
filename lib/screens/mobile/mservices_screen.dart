import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/bullet_text.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_footer.dart';
import 'package:ccw/widgets/mobile/mobile_services_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MservicesScreen extends StatelessWidget {
  const MservicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceList = [
      ServicesItem(
        title: 'Personal & Non-Resident Tax Services',
        image: 'assets/images/personal.png',
        line1: 'Individual tax return preparation (T1)',
        line2: 'Strategic tax planning to maximize deductions',
        line3: 'Assistance for self-employed professionals & freelancers',
        line4: 'Tax optimization for high-net-worth individuals',
        line5: 'T1135 (Foreign Income Verification Statement) preparations',
        line6:
            'NR4, NR6, and Section 216 & 217 tax returns for non returns for non-residents',
      ),
      ServicesItem(
        title: 'Corporate & Business Tax Services',
        image: 'assets/images/corporate.png',
        line1: 'Corporate tax return preparation (T2)',
        line2: 'Tax planning and structuring for businesses',
        line3: 'GST/PST/HST filings',
        line4: 'Tax compliance and audit support',
        line5:
            'Tax-efficient structuring for operating corporations & holding companies',
      ),
      ServicesItem(
        title: 'Advisory & Business Consulting',
        image: 'assets/images/advisory.png',
        line1: 'Financial strategic planning',
        line2: 'Business restructuring',
        line3: 'Estate and succession planning',
        line4: 'Business incorporation & structuring guidance(Not legal work)',
        line5: 'Outsourced CFO & financial controller services',
      ),
      ServicesItem(
        title: 'Accounting & Bookkeeping',
        image: 'assets/images/accounting.png',
        line1: 'Monthly, quarterly, and annual bookkeeping',
        line2: 'Financial statement preparation (compilation)',
        line3: 'Cash flow and budgeting analysis',
        line4:
            'Payroll processing and compliance (including T4, T4A, T5 filings)',
      ),
      ServicesItem(
        title: 'Real Estate & Investment Taxation',
        image: 'assets/images/realState.png',
        line1: 'Tax strategies for rental properties and real estate investors',
        line2: 'Capital gains tax planning',
        line3: 'Structuring for holding companies',
      ),
      ServicesItem(
        title: 'Compliance & Regulatory Services',
        image: 'assets/images/compliance.png',
        line1: 'Financial strategic planning',
        line2: 'Business restructuring',
        line3: 'Estate and succession planning',
      ),
      ServicesItem(
        title: 'Trust & Estate Tax Services',
        image: 'assets/images/trust.png',
        line1: 'Trust tax return preparation (T3)',
        line2: 'Estate planning and tax-efficient wealth transfers',
      ),
    ];
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
              height: ResponsiveMobileUtils.getResponsiveSize(context, 1700),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/services.png',
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 290),
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 402),
                    fit: BoxFit.cover,
                  ),
                  
                  
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: MyColor.white,
                            fontWeight: FontWeight.w900,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context,
                              20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveMobileUtils.getResponsiveSize(
                              context, 12),
                        ),
                        SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 359),
                          child: Text(
                            'Helping businesses and individuals streamline accounting, optimize tax strategies, and stay compliant.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColor.white,
                              fontWeight: FontWeight.w200,
                              fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context,
                                14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top:
                          ResponsiveMobileUtils.getResponsiveSize(context, 340),
                      child: Column(
                        spacing: ResponsiveMobileUtils.getResponsiveSize(
                            context, 52),
                        children: List.generate(serviceList.length, (index) {
                          final item = serviceList[index];
                          return item
                              .animate()
                              .slideX(
                                begin: 1,
                                end: 0,
                                duration: 600.ms,
                                delay: (index * 200).ms, // تأخیر بر اساس ایندکس
                              )
                              .fade(
                                duration: 500.ms,
                                delay: (index * 200).ms,
                              )
                              .shimmer(
                                delay: (index * 200).ms,
                                duration: 1500.ms,
                              );
                        }),
                      )),
                      MobileAppBar(),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 80),
            ),
            MobileFooter()
          ],
        ),
      ),
    );
  }
}
