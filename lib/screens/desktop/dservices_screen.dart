import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/desktop/app_bar.dart';
import 'package:ccw/widgets/desktop/footer.dart';
import 'package:ccw/widgets/desktop/services_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DservicesScreen extends StatefulWidget {
  const DservicesScreen({super.key});

  @override
  State<DservicesScreen> createState() => _DservicesScreenState();
}

class _DservicesScreenState extends State<DservicesScreen> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final serviceList = [
      DesktopServicesItem(
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
      DesktopServicesItem(
        title: 'Corporate & Business Tax Services',
        image: 'assets/images/corporate.png',
        line1: 'Corporate tax return preparation (T2)',
        line2: 'Tax planning and structuring for businesses',
        line3: 'GST/PST/HST filings',
        line4: 'Tax compliance and audit support',
        line5:
            'Tax-efficient structuring for operating corporations & holding companies',
      ),
      DesktopServicesItem(
        title: 'Advisory & Business Consulting',
        image: 'assets/images/advisory.png',
        line1: 'Financial strategic planning',
        line2: 'Business restructuring',
        line3: 'Estate and succession planning',
        line4: 'Business incorporation & structuring guidance(Not legal work)',
        line5: 'Outsourced CFO & financial controller services',
      ),
      DesktopServicesItem(
        title: 'Accounting & Bookkeeping',
        image: 'assets/images/accounting.png',
        line1: 'Monthly, quarterly, and annual bookkeeping',
        line2: 'Financial statement preparation (compilation)',
        line3: 'Cash flow and budgeting analysis',
        line4:
            'Payroll processing and compliance (including T4, T4A, T5 filings)',
      ),
      DesktopServicesItem(
        title: 'Real Estate & Investment Taxation',
        image: 'assets/images/realState.png',
        line1: 'Tax strategies for rental properties and real estate investors',
        line2: 'Capital gains tax planning',
        line3: 'Structuring for holding companies',
      ),
      DesktopServicesItem(
        title: 'Compliance & Regulatory Services',
        image: 'assets/images/compliance.png',
        line1: 'Financial strategic planning',
        line2: 'Business restructuring',
        line3: 'Estate and succession planning',
      ),
      DesktopServicesItem(
        title: 'Trust & Estate Tax Services',
        image: 'assets/images/trust.png',
        line1: 'Trust tax return preparation (T3)',
        line2: 'Estate planning and tax-efficient wealth transfers',
      ),
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 600),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/services.png',
                    width:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
                    height:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 600),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: ResponsiveDesktopUtils.getResponsiveSize(context, 220),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: MyColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                              context,
                              48,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 24),
                        ),
                        SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 600),
                          child: Text(
                            'We provide tailored accounting, tax, and advisory services to help individuals and businesses grow with clarity, confidence, and compliance.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColor.white,
                              fontWeight: FontWeight.w200,
                              fontSize:
                                  ResponsiveDesktopUtils.getResponsiveSize(
                                context,
                                20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyAppbar(
                    size: size,
                    homeStyle: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                    aboutStyle: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                    servicesStyle: TextStyle(
                         decoration: TextDecoration.underline,
                        decorationThickness: 1,
                        decorationColor: MyColor.primary,
                        fontSize: size.width / 90,
                        color: MyColor.primary,
                        fontWeight: FontWeight.w200),
                    resourcesStyle: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                    contactStyle: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 94),
            ),
            SizedBox(
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
              child: VisibilityDetector(
                key: Key('wrap'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.2 && !_isVisible) {
                    setState(
                      () {
                        _isVisible = true;
                      },
                    );
                  }
                },
                child: Wrap(
                  spacing:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 48),
                  runSpacing:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 80),
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: List.generate(serviceList.length, (index) {
                    final item = serviceList[index];
                    return SizedBox(
                      width: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 543),
                      height: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 282),
                      child: item
                          .animate(target: _isVisible ? 1 : 0)
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
                          ),
                    );
                  }),
                ),
              ),
            ),
            Footer(size: size)
          ],
        ),
      ),
    );
  }
}
