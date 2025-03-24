import 'dart:math';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/widgets/app_bar.dart';
import 'package:ccw/widgets/home_three_container.dart';
import 'package:ccw/widgets/who_we_help.dart';
import 'package:ccw/widgets/why_choose_ccw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DhomeScreen extends StatefulWidget {
  const DhomeScreen({super.key});

  @override
  State<DhomeScreen> createState() => _DhomeScreenState();
}

class _DhomeScreenState extends State<DhomeScreen> {
  List<bool> isVisible1 = List.generate(5, (index) => false);
  List<bool> isVisible2 = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 1000,

              //! image for backGround from group of people with appBar above and text and button and 3 container
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: size.width / 1,
                    child: Image.asset('assets/images/peapole.png',
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 0,
                    child: MyAppbar(
                      size: size,
                    ),
                  ),
                  Positioned(
                    top: 196,
                    child: Column(
                      children: [
                        Text(
                          'Financial Clarity , Trusted Guidance',
                          style: TextStyle(
                              fontSize: 48,
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                            width: size.width / 2.29,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Helping business owners streamline accounting, optimize tax strategies, and stay compliant- so you can focus on what you do best',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MyColor.white,
                                  fontWeight: FontWeight.w200),
                            )),
                        SizedBox(height: 28),
                        Row(
                          spacing: 25,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: 56,
                                width: 196,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.white, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'Get Started Today',
                                  style: TextStyle(
                                      color: MyColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: 56,
                                width: 196,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: 56,
                                width: 196,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.white, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'See How We Help',
                                  style: TextStyle(
                                      color: MyColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //* 3 container with icon and title and description
                  Positioned(
                      top: 515,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: 19,
                        children: [
                          ThreeContainer(
                            title: 'Smooth Connectivity',
                            description:
                                'We prioritize clear, proactive communication to keep you informed and confident in your financial decisions.',
                            image: 'assets/images/smoothConnectivity.png',
                          )
                              .animate()
                              .slideX(
                                begin: 1, // شروع از سمت راست
                                end: 0, // پایان در موقعیت عادی
                                duration: 600.ms, // تأخیر برای هر آیتم
                                curve: Curves.easeIn,
                              )
                              .fade(duration: 300.ms, delay: 100.ms)
                              .shimmer(
                                delay: Duration(milliseconds: 100),
                                duration: Duration(milliseconds: 1500),
                              ),
                          ThreeContainer(
                            title: 'Expert Accounting',
                            description:
                                'Over a decade of experience delivering precise financial services, ensuring compliance and efficiency.',
                            image: 'assets/images/expertAccounting.png',
                          )
                              .animate()
                              .slideX(
                                begin: 1, // شروع از سمت راست
                                end: 0, // پایان در موقعیت عادی
                                duration: 800.ms, // تأخیر برای هر آیتم
                                curve: Curves.easeIn,
                              )
                              .fade(duration: 500.ms, delay: 100.ms)
                              .shimmer(
                                delay: Duration(milliseconds: 100),
                                duration: Duration(milliseconds: 1500),
                              ),
                          ThreeContainer(
                            title: 'Reliable Service',
                            description:
                                'Assurance that work is completed faster to meet client deadlines and allowances for revisions',
                            image: 'assets/images/reliableService.png',
                          )
                              .animate()
                              .slideX(
                                begin: 1, // شروع از سمت راست
                                end: 0, // پایان در موقعیت عادی
                                duration: 1000.ms, // تأخیر برای هر آیتم
                                curve: Curves.easeIn,
                              )
                              .fade(duration: 700.ms, delay: 100.ms)
                              .shimmer(
                                delay: Duration(milliseconds: 100),
                                duration: Duration(milliseconds: 1500),
                              ),
                        ],
                      ))
                ],
              ),
            ),

            //! wrap number one with 5 container and animation with shimmer have icon, title and description
            Text(
              textAlign: TextAlign.center,
              'Who We Help',
              style: TextStyle(
                  fontSize: 36,
                  color: MyColor.secendry,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              textAlign: TextAlign.center,
              'At CCW CPA, we specialize in providing expert accounting and tax services for:',
              style: TextStyle(
                  fontSize: 18,
                  color: MyColor.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 109,
            ),
            SizedBox(
              height: 900,
              width: size.width / 1,
              child: Wrap(
                spacing: 250,
                runSpacing: 62,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: List.generate(5, (index) {
                  List<Map<String, String>> data = [
                    {
                      "image": "assets/images/ownerIcon.png",
                      "title": "Owner-Operators & Entrepreneurs",
                      "description":
                          "Stay focused on running your business while we handle your financials"
                    },
                    {
                      "image": "assets/images/smallIcon.png",
                      "title": "Small & Mid-Sized Businesses",
                      "description":
                          "We offer bookkeeping, payroll, tax planning, and compliance solutions to help you grow"
                    },
                    {
                      "image": "assets/images/operationIcon.png",
                      "title": "Operating & Holding Companies",
                      "description":
                          "Whether you own a business or manage real estate assets, we ensure your financials are structured for tax efficiency and compliance"
                    },
                    {
                      "image": "assets/images/individualIcon.png",
                      "title": "Individuals & Families",
                      "description":
                          "We assist with personal tax returns, strategic tax planning, and maximizing deductions. Let us simplify your taxes and help you save more."
                    },
                    {
                      "image": "assets/images/selfEmploydIcon.png",
                      "title": "Self-Employed Professionals",
                      "description":
                          "Whether you’re a consultant, contractor, or freelancer, we streamline your finances, optimize deductions, and ensure hassle-free tax filing—so you can focus on growing your business."
                    }
                  ];

                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2 && !isVisible1[index]) {
                        setState(() {
                          isVisible1[index] = true;
                        });
                      }
                    },
                    child: WhoWeHelp(
                      size: size,
                      image: data[index]["image"]!,
                      title: data[index]["title"]!,
                      description: data[index]["description"]!,
                    )
                        .animate(
                          // delay: dd,
                          target: isVisible1[index] ? 1 : 0,
                        )
                        .slideX(
                            begin: 1,
                            end: 0,
                            duration: 400.ms,
                            curve: Curves.easeIn)
                        .fade(duration: 300.ms, delay: 100.ms)
                        .shimmer(delay: 100.ms, duration: 1500.ms),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 127,
            ),

            //! wrap number two with 4 container and animation with shimmer have icon, title and description
            Text(
              'Why Choose CCW',
              style: TextStyle(
                  fontSize: 36,
                  color: MyColor.secendry,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 72,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 80,
              spacing: 45,
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
                    key: Key('item-$index'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2 && !isVisible2[index]) {
                        setState(() {
                          isVisible2[index] = true;
                        });
                      }
                    },
                    child: WhyChooseCcw(
                      title: data[index]["title"]!,
                      description: data[index]["description"]!,
                      image: data[index]["image"]!,
                    )
                        .animate(target: isVisible2[index] ? 1 : 0)
                        .slideX(
                            begin: 1,
                            end: 0,
                            duration: 400.ms,
                            curve: Curves.easeIn)
                        .fade(duration: 300.ms, delay: 50.ms)
                        .shimmer(delay: 100.ms, duration: 1500.ms),
                  );
                },
              ),
            ),
            SizedBox(
              height: 164,
            ),
            //! footer with logo and map
            Divider(
              indent: size.width / 10,
              thickness: 1,
              color: MyColor.white,
              endIndent: size.width / 10,
            ),
            SizedBox(
              height: 119,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ccwLogo.png',
                      height: 28,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        'Build by aradazr.dev, All Rights Reserved',
                        style: TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width / 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    Text(
                      'Documentation',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'License',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Changelog',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('See us on Google Map:',
                        style: TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Image.asset(
                      'assets/images/map.png',
                      height: size.height / 2.8,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 73,
            ),
            Container(
              height: 59,
              width: 59,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Copyright © 2019. Crafted with love.',
              style: TextStyle(
                color: MyColor.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 103,
            )
          ],
        ),
      ),
    );
  }
}
