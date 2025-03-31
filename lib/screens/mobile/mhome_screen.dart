import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/mobile_footer.dart';
import 'package:ccw/widgets/mobile/mobile_three_container.dart';
import 'package:ccw/widgets/mobile/mobile_who_we_help.dart';
import 'package:ccw/widgets/mobile/mobile_why_choose_ccw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MhomeScreen extends StatefulWidget {
  const MhomeScreen({super.key});

  @override
  State<MhomeScreen> createState() => _MhomeScreenState();
}

class _MhomeScreenState extends State<MhomeScreen> {
  Set<int> visibleItems = {};
  Set<int> visibleItems2 = {};
  Set<int> visibleItems3 = {};
  // ذخیره آیتم‌های دیده‌شده
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
                height: ResponsiveMobileUtils.getResponsiveSize(context, 213),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/peapole.png',
                      fit: BoxFit.cover,
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 402),
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 217),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ResponsiveMobileUtils.getResponsiveSize(context, 27),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ccwLogo.png',
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 26),
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 69),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 265.97),
                          ),
                          Image.asset(
                            'assets/images/menu.png',
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 24),
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 24),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: ResponsiveMobileUtils.getResponsiveSize(context, 88),
                      child: SizedBox(
                        width:
                            ResponsiveMobileUtils.getResponsiveSize(context, 300),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Financial Clarity , Trusted Guidance',
                          style: TextStyle(
                              fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 20),
                              color: MyColor.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Positioned(
                        top:
                            ResponsiveMobileUtils.getResponsiveSize(context, 154),
                        child: SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 350),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Helping business owners streamline accounting, optimize tax strategies, and stay compliant- so you can focus on what you do best',
                            style: TextStyle(
                                fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                    context, 14),
                                color: MyColor.white,
                                fontWeight: FontWeight.w200),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 24),
              ),
              Column(
                spacing: ResponsiveMobileUtils.getResponsiveSize(context, 8),
                children: [
                  Container(
                      alignment: Alignment.center,
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 48),
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 371),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: MyColor.linear),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        'Read our Story',
                        style: TextStyle(
                            color: MyColor.white,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 14),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      alignment: Alignment.center,
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 48),
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 371),
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColor.white, width: 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        'Get Started Today',
                        style: TextStyle(
                            color: MyColor.white,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 14),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: ResponsiveMobileUtils.getResponsiveSize(context, 48),
                    width: ResponsiveMobileUtils.getResponsiveSize(context, 371),
                    decoration: BoxDecoration(
                        border: Border.all(color: MyColor.white, width: 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'See How We Help',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 14),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 45),
              ),
              Column(
                spacing: ResponsiveMobileUtils.getResponsiveSize(context, 16),
                children: List.generate(3, (index) {
                  List<Map<String, String>> data = [
                    {
                      "title": "Smooth Connectivity",
                      "description":
                          "We prioritize clear, proactive communication to keep you informed and confident in your financial decisions.",
                      "image": "assets/images/smoothConnectivity.png"
                    },
                    {
                      "title": "Expert Accounting",
                      "description":
                          "Over a decade of experience delivering precise financial services, ensuring compliance and efficiency.",
                      "image": "assets/images/expertAccounting.png"
                    },
                    {
                      "title": "Reliable Service",
                      "description":
                          "Assurance that work is completed faster to meet client deadlines and allowances for revisions",
                      "image": "assets/images/reliableService.png"
                    }
                  ];
        
                  return VisibilityDetector(
                    key: Key('item_$index'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.2) {
                        setState(() {
                          visibleItems.add(index);
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      child: MobileThreeContainer(
                        title: data[index]["title"]!,
                        description: data[index]["description"]!,
                        image: data[index]["image"]!,
                      )
                          .animate(target: visibleItems.contains(index) ? 1 : 0)
                          .slideX(
                              begin: 1, end: 0, duration: (400 + index * 200).ms)
                          .fade(duration: 300.ms, delay: 100.ms)
                          .shimmer(delay: 100.ms, duration: 1500.ms),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 74),
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Who We Help',
                    style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(context, 18),
                        color: MyColor.secendry,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: ResponsiveMobileUtils.getResponsiveSize(context, 8),
                  ),
                  SizedBox(
                    width: ResponsiveMobileUtils.getResponsiveSize(context, 297),
                    child: Text(
                      textAlign: TextAlign.center,
                      'At CCW CPA, we specialize in providing expert accounting and tax services for:',
                      style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 12),
                          color: MyColor.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 30),
              ),
              Column(
                spacing: ResponsiveMobileUtils.getResponsiveSize(context, 24),
                children: List.generate(
                  5,
                  (index) {
                    List<Map<String, String>> data2 = [
                      {
                        "title": "Owner-Operators & Entrepreneurs",
                        "description":
                            "Stay focused on running your business while we handle your financials",
                        "image": "assets/images/ownerIcon.png"
                      },
                      {
                        "title": "Small & Mid-Sized Businesses",
                        "description":
                            "We offer bookkeeping, payroll, tax planning, and compliance solutions to help you grow",
                        "image": "assets/images/smallIcon.png"
                      },
                      {
                        "title": "Operating & Holding Companies",
                        "description":
                            "Whether you own a business or manage real estate assets, we ensure your financials are structured for tax efficiency and compliance",
                        "image": "assets/images/operationIcon.png"
                      },
                      {
                        "title": "Individuals & Families",
                        "description":
                            "We assist with personal tax returns, strategic tax planning, and maximizing deductions. Let us simplify your taxes and help you save more.",
                        "image": "assets/images/individualIcon.png"
                      },
                      {
                        "title": "Self-Employed Professionals",
                        "description":
                            "Whether you’re a consultant, contractor, or freelancer, we streamline your finances, optimize deductions, and ensure hassle-free tax filing—so you can focus on growing your business.",
                        "image": "assets/images/selfEmploydIcon.png"
                      }
                    ];
        
                    return VisibilityDetector(
                      key: Key('item2_$index'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.2) {
                          setState(() {
                            visibleItems2.add(index);
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: MobileWhoWeHelp(
                          title: data2[index]["title"]!,
                          description: data2[index]["description"]!,
                          image: data2[index]["image"]!,
                        )
                            .animate(target: visibleItems2.contains(index) ? 1 : 0)
                          .slideX(
                              begin: 1, end: 0, duration: (400 + index * 200).ms)
                          .fade(duration: 300.ms, delay: 100.ms)
                          .shimmer(delay: 100.ms, duration: 1500.ms),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 74),
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Why Choose CCW',
                    style: TextStyle(
                        fontSize:
                            ResponsiveMobileUtils.getResponsiveSize(context, 18),
                        color: MyColor.secendry,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: ResponsiveMobileUtils.getResponsiveSize(context, 8),
                  ),
                  SizedBox(
                    width: ResponsiveMobileUtils.getResponsiveSize(context, 297),
                    child: Text(
                      textAlign: TextAlign.center,
                      'At CCW CPA, we specialize in providing expert accounting and tax services for:',
                      style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 12),
                          color: MyColor.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 48),
              ),
              Column(
                spacing: ResponsiveMobileUtils.getResponsiveSize(context, 50),
                children: List.generate(
                  4,
                  (index) {
                    List<Map<String, String>> data = [
                      {
                        "title": "Personalized Tax & Financial Strategies",
                        "description":
                            "No two clients are alike, and we develop customized financial solutions to fit your needs.",
                        "image": "assets/images/personalized.png",
                      },
                      {
                        "title": "Decades of Expertise",
                        "description":
                            "Led by an experienced CPA and supported by a retired partner, we bring a wealth of knowledge and experience.",
                        "image": "assets/images/decadesIcon.png",
                      },
                      {
                        "title": "Seamless Transition & Ongoing Support ",
                        "description":
                            "With a deep respect for our firm’s history, we ensure continuity while bringing in modern strategies for success.",
                        "image": "assets/images/seamless.png",
                      },
                      {
                        "title": "Commitment to Excellence",
                        "description":
                            "We are dedicated to staying ahead in the industry, providing expert financial guidance that helps you grow.",
                        "image": "assets/images/commitment.png",
                      }
                    ];
        
                    return VisibilityDetector(
                      key: Key('item3-$index'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0.2) {
                          setState(() {
                            visibleItems3.add(index);
                          });
                        }
                      },
                      child: MobileWhyChooseCcw(
                        title: data[index]["title"]!,
                        description: data[index]["description"]!,
                        image: data[index]["image"]!,
                      )
                          .animate(target: visibleItems3.contains(index) ? 1 : 0)
                          .slideX(
                              begin: 1, end: 0, duration: (400 + index * 200).ms)
                          .fade(duration: 300.ms, delay: 100.ms)
                          .shimmer(delay: 100.ms, duration: 1500.ms),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 74),
              ),
              MobileFooter(),
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}


