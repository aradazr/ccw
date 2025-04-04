import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_core_vlaues.dart';
import 'package:ccw/widgets/mobile/mobile_footer.dart';
import 'package:ccw/widgets/mobile/mobile_our_firm_and_other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MaboutUsScreen extends StatefulWidget {
  const MaboutUsScreen({super.key});

  @override
  State<MaboutUsScreen> createState() => _MaboutUsScreenState();
}

class _MaboutUsScreenState extends State<MaboutUsScreen> {
  Set<int> visibleItems = {};
  Set<int> visibleItems2 = {};
  bool _isVisible = false;
  final List<List<Color>> itemGradients = [
    [Color(0xFF0E0E0E), Color(0xFF0E2E2E)],
    [Color(0xFF0E0E0E), Color(0xFF221B0E)],
    [Color(0xFF0E0E0E), Color(0xFF1F272B)],
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
              height: ResponsiveMobileUtils.getResponsiveSize(context, 650),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -ResponsiveMobileUtils.getResponsiveSize(context, 400),
                    child: Image.asset(
                      'assets/images/greenBlur2.png',
                      height: ResponsiveMobileUtils.getResponsiveSize(
                          context, 1000),
                      width: ResponsiveMobileUtils.getResponsiveSize(
                          context, 1200),
                      fit: BoxFit.cover,
                    ),
                  ),
                  MobileAppBar(),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 96),
                    child: SizedBox(
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 362),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OUR TEAM',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 12),
                                color: MyColor.subTitle,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 4),
                          ),
                          SizedBox(
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 199),
                            child: Text(
                              textAlign: TextAlign.left,
                              'Experience and integrity by our team',
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveMobileUtils.getResponsiveSize(
                                          context, 16),
                                  color: MyColor.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 8),
                          ),
                          SizedBox(
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 374),
                            child: AnimatedTextKit(
                                repeatForever: false,
                                isRepeatingAnimation: false,
                                displayFullTextOnTap: true,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    speed: Duration(milliseconds: 20),
                                      cursor: '',
                                      textStyle: TextStyle(
                                          fontSize: ResponsiveMobileUtils
                                              .getResponsiveSize(
                                            context,
                                            12,
                                          ),
                                          color: MyColor.grey),
                                      'Our team is made up of experienced CPAs who are dedicated to helping clients achieve financial clarity and success. We take a collaborative approach to problem-solving, ensuring that every client benefits from our collective expertise.'),
                                ]),
                          ),
                          SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 94),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 253),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 374),
                          height: ResponsiveMobileUtils.getResponsiveSize(
                              context, 44),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(2000),
                            border: Border.all(
                              width: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 2),
                              color: Colors
                                  .transparent, // خود border رنگ نمی‌دیم چون می‌خوایم gradient بشه
                            ),
                          ),
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xffE3C985), Color(0xffA69464)],
                            ).createShader(bounds),
                            child: Container(
                              width: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 374),
                              height: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 44),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 16)),
                                border: Border.all(
                                  width:
                                      ResponsiveMobileUtils.getResponsiveSize(
                                          context, 2),
                                  color:
                                      Colors.white, // این رنگ میره زیر gradient
                                ),
                              ),
                            ),
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffE3C985),
                              Color(0xffA69464)
                            ], // رنگ‌های گرادیانت برای تکست
                          ).createShader(bounds),
                          child: Text(
                            'Meet our team',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 16),
                                color: MyColor.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 314),
                    child: Image.asset(
                      'assets/images/mobileAboutUsPeople.png',
                      width: ResponsiveMobileUtils.getResponsiveSize(
                          context, 240.26),
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 288),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ResponsiveMobileUtils.getResponsiveSize(context, 402),
              child: Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveMobileUtils.getResponsiveSize(context, 26)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT US',
                      style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 12),
                          color: MyColor.secendry,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 4),
                    ),
                    SizedBox(
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 363),
                      child: Text(
                        textAlign: TextAlign.left,
                        'Comprehensive and Expert Financial Solutions, Carefully Tailored to Meet Your Unique Needs and Long-Term Goals',
                        style: TextStyle(
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 16),
                            color: MyColor.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height:
                          ResponsiveMobileUtils.getResponsiveSize(context, 16),
                    ),
                    SizedBox(
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 363),
                          height: ResponsiveMobileUtils.getResponsiveSize(context, 221),
                      child: AnimatedTextKit(
                        repeatForever: false,
                    isRepeatingAnimation: false,
                    displayFullTextOnTap: true,
                        animatedTexts:[ 
                        TypewriterAnimatedText(
                          cursor: '',
                        speed: Duration(milliseconds: 20),
                            textStyle: TextStyle(
                                fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                  context,
                                  12,
                                ),
                                color: MyColor.grey),
                            'At CCW CPA, we are more than just accountants—we are strategic partners dedicated to your financial success. With decades of experience in tax, accounting, and business advisory services, we help individuals and businesses navigate the complexities of financial management with clarity and confidence.As a firm built on trust, expertise, and innovation, we prioritize personalized service, ensuring that every client receives solutions tailored to their specific needs. Whether you’re a business owner seeking tax optimization, an investor looking for strategic planning, or an individual in need of financial guidance, we are here to help you make informed decisions with confidence.',
                            ),]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 32),
            ),
            VisibilityDetector(
              key: const Key('animated-image'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.7 && !_isVisible) {
                  setState(
                    () {
                      _isVisible = true;
                    },
                  );
                }
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _isVisible ? 1.0 : 0.0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 800),
                  scale: _isVisible ? 1.0 : 0.8,
                  child: Image.asset(
                    'assets/images/mobileSpace.png',
                    fit: BoxFit.cover,
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 402),
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 216),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 35),
            ),
            Column(
              spacing: ResponsiveMobileUtils.getResponsiveSize(context, 15),
              children: List.generate(
                3,
                (index) {
                  List<Map<String, String>> data = [
                    {
                      "title": "Our Firm",
                      "description":
                          "CCW CPA is a professional accounting firm with a reputation for excellence. Under the leadership of Parham Alizadehkia, CPA, our firm continues to build on a strong foundation, ensuring seamless transitions and continuity of service...",
                      "image": "assets/images/OurFirm.png",
                    },
                    {
                      "title": "Our Misson",
                      "description":
                          "Our mission is to empower businesses and individuals with trusted financial guidance, expert accounting services, and personalized tax strategies. We are committed to delivering solutions that help our clients achieve their financial goals while maintaining the...",
                      "image": "assets/images/OurFirm.png",
                    },
                    {
                      "title": "Our Vision",
                      "description":
                          "We strive to be the premier CPA firm, recognized for driving financial success and growth for our clients. By continually innovating and evolving our services, we ensure that businesses and individuals receive forward-thinking, ethical, and expert financial advice tailored totheir needs.",
                      "image": "assets/images/OurFirm.png",
                    },
                  ];

                  return VisibilityDetector(
                    key: Key('item-$index'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2) {
                        setState(() {
                          visibleItems.add(index);
                        });
                      }
                    },
                    child: MobileOurFirmAndOther(
                      title: data[index]["title"]!,
                      description: data[index]["description"]!,
                      image: data[index]["image"]!,
                      gradientColors:
                          itemGradients[index % itemGradients.length],
                    )
                        .animate(target: visibleItems.contains(index) ? 1 : 0)
                        .slideX(
                            begin: 1, end: 0, duration: (400 + index * 200).ms)
                        .fade(duration: 300.ms, delay: 100.ms)
                        .shimmer(delay: 100.ms, duration: 1500.ms),
                  );
                },
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 69),
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
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 6),
                ),
                SizedBox(
                  width: ResponsiveMobileUtils.getResponsiveSize(context, 322),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Our core values shape us—integrity, innovation, and excellence.',
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
              height: ResponsiveMobileUtils.getResponsiveSize(context, 26),
            ),
            Column(
              spacing: ResponsiveMobileUtils.getResponsiveSize(context, 16),
              children: List.generate(
                4,
                (index) {
                  List<Map<String, String>> data = [
                    {
                      "title": "Our Vision",
                      "description":
                          "We uphold the highest ethical standards, ensuring transparency and honesty in everything we do.",
                      "image": "assets/images/eyeIcon.png",
                    },
                    {
                      "title": "Client-Focused",
                      "description":
                          "Every client’s success is our priority, and we tailor our services to their unique financial landscape.",
                      "image": "assets/images/clientFocused.png",
                    },
                    {
                      "title": "Excellence",
                      "description":
                          "We embrace technology and continuous learning to provide the best solutions for our clients.",
                      "image": "assets/images/excellence.png",
                    },
                    {
                      "title": "Leader Sheep",
                      "description":
                          "We strive to be the premier CPA firm, recognized for driving financial success and growth for our clients. By continually innovating and evolving our services, we ensure that businesses and individuals receive forward-thinking, ethical, and expert financial advice tailored totheir needs.",
                      "image": "assets/images/leadership.png",
                    },
                  ];

                  return VisibilityDetector(
                    key: Key('item2-$index'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2) {
                        setState(() {
                          visibleItems2.add(index);
                        });
                      }
                    },
                    child: MobileCoreValues(
                      title: data[index]["title"]!,
                      description: data[index]["description"]!,
                      image: data[index]["image"]!,
                    )
                        .animate(target: visibleItems2.contains(index) ? 1 : 0)
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
            MobileFooter()
          ],
        ),
      ),
    );
  }
}
