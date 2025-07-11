import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_company_member.dart';
import 'package:ccw/widgets/mobile/mobile_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MmeetOurExpertScreen extends StatefulWidget {
  const MmeetOurExpertScreen({super.key});

  @override
  State<MmeetOurExpertScreen> createState() => _MmeetOurExpertScreenState();
}

class _MmeetOurExpertScreenState extends State<MmeetOurExpertScreen> {
  final double _baseHeight = 700;
  double _dynamicHeight = 700;
  final List<bool> _expandedStates = List.filled(4, false);

  void _onExpandChanged(int index, bool isExpanded) {
    setState(() {
      _expandedStates[index] = isExpanded;

      double extraHeight = 0;
      for (var expanded in _expandedStates) {
        if (expanded) {
          extraHeight += ResponsiveMobileUtils.getResponsiveSize(context, 250);
        }
      }

      _dynamicHeight = _baseHeight + extraHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "title": "CPA – Partner",
        "name": "Parham Alizadehkia",
        "image": "assets/images/parham.png",
        "description":
            "Parham Alizadehkia is an experienced CPA with a decade of experience in public practice, specializing in taxation and financial management. Having worked closely with numerous successful enterprises across Vancouver, he is committed to helping businesses achieve long-term financial success. Parham’s expertise lies in delivering comprehensive tax strategies that optimize business performance, allowing clients to focus on operational excellence. His dedication to sound financial practices and strategic tax planning ensures that businesses not only meet compliance requirements but also thrive in a competitive landscape."
      },
      {
        "title": "Retired Partner (Advisor)",
        "name": "Brian Cawley, CPA, CA",
        "image": "assets/images/brian.png",
        "description":
            "With over 40 years of experience, Brian Cawley has been a trusted advisor to owner-operated businesses since 1985. His extensive tax knowledge and deep understanding of the financial challenges faced by entrepreneurs have made him a cornerstone in the industry. Brian’s commitment to providing tailored solutions has helped countless business owners navigate the complexities of taxation and financial planning. As he transitions into retirement, his legacy continues through the firm, ensuring that clients receive the same level of expertise and personalized service."
      },
      {
        "title": "CPA Student",
        "name": "Kantaro Horino",
        "image": "assets/images/colette.png",
        "description":
            "Kantaro Horino is a CPA candidate with a passion for accounting and tax services. Born and raised in Vancouver, he is fluent in English and Japanese and holds a Business degree from the University of Victoria. After multiple internships, he returned to CCW CPA as a tax accountant. Under the mentorship of seasoned professionals, he continues to grow his expertise in taxation and financial advisory."
      },
      {
        "title": "Administrative Specialist",
        "name": "Colette Lam",
        "image": "assets/images/kantaro.png",
        "description":
            "Since joining CCW CPA in 2013, Colette Lam has been a key pillar of stability and efficiency within the firm. With years of experience in public practice, she plays a crucial role in ensuring the seamless operation of our firm, particularly during the busiest seasons. Highly organized and detail-oriented, Colette excels in problem-solving, eƯective communication, and client service, consistently going beyond the scope of her administrative role to support both the team and our clients. Her deep knowledge of administrative processes and unwavering commitment to excellence contribute significantly to the professionalism and success of CCW CPA."
      }
    ];

    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _dynamicHeight,
              width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  
                  MobileAppBar(),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 88),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Meets our experts',
                          style: TextStyle(
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 20),
                            color: MyColor.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: ResponsiveMobileUtils.getResponsiveSize(context, 12)),
                        SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(context, 370),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Discover the passionate of innovators, strategist, and customer success professionals working tirelessly to help you achieve your goals',
                            style: TextStyle(
                              fontSize: ResponsiveMobileUtils.getResponsiveSize(context, 14),
                              color: MyColor.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 223),
                    child: Column(
                      spacing: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                      children: List.generate(4, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: MobileCompanyMember(
                            image: data[index]['image']!,
                            name: data[index]['name']!,
                            title: data[index]['title']!,
                            description: data[index]['description']!,
                            onExpand: (isExpanded) => _onExpandChanged(index, isExpanded),
                          ),
                        )
                            .animate()
                            .slideX(begin: 1, end: 0, duration: (600 + index * 200).ms)
                            .fade(duration: 300.ms, delay: 100.ms)
                            .shimmer(delay: (600 + index * 200).ms, duration: 1500.ms);
                      }),
                    ),
                  ),
                ],
              ),
            ),
            MobileFooter(),
          ],
        ),
      ),
    );
  }
}