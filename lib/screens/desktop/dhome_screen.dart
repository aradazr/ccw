import 'dart:math';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/widgets/app_bar.dart';
import 'package:ccw/widgets/footer.dart';
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
              height: size.width / 1.7,

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
                      homeStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          decorationColor: MyColor.primary,
                          fontSize: size.width/90,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w200),
                      aboutStyle: TextStyle(
                          fontSize: size.width/90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      servicesStyle: TextStyle(
                          fontSize: size.width/90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      resourcesStyle: TextStyle(
                          fontSize: size.width/90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      contactStyle: TextStyle(
                          fontSize: size.width/90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Positioned(
                    top: size.width/7.34,
                    child: Column(
                      children: [
                        Text(
                          'Financial Clarity , Trusted Guidance',
                          style: TextStyle(
                              fontSize: size.width/30,
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.width/57.6),
                        SizedBox(
                            width: size.width / 2.29,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Helping business owners streamline accounting, optimize tax strategies, and stay compliant- so you can focus on what you do best',
                              style: TextStyle(
                                  fontSize: size.width/72,
                                  color: MyColor.white,
                                  fontWeight: FontWeight.w200),
                            )),
                        SizedBox(height: size.width/51.42),
                        Row(
                          spacing: size.width/57.6,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: size.width/25.71,
                                width: size.width /7.34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.white, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'Get Started Today',
                                  style: TextStyle(
                                      color: MyColor.white,
                                      fontSize: size.width/80,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: size.width/25.71,
                                width: size.width /7.34,
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
                                      fontSize: size.width/80,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: size.width/25.71,
                                width: size.width /7.34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.white, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'See How We Help',
                                  style: TextStyle(
                                      color: MyColor.white,
                                      fontSize: size.width /80,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //* 3 container with icon and title and description
                  Positioned(
                      top: size.width /2.8,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: size.width/90,
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
            SizedBox(
              height: size.width/7.2,
            ),
            //! wrap number one with 5 container and animation with shimmer have icon, title and description
            Text(
              textAlign: TextAlign.center,
              'Who We Help',
              style: TextStyle(
                  fontSize: size.width / 40,
                  color: MyColor.secendry,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.width/80,
            ),
            Text(
              textAlign: TextAlign.center,
              'At CCW CPA, we specialize in providing expert accounting and tax services for:',
              style: TextStyle(
                  fontSize: size.width/80,
                  color: MyColor.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.width/13.21,
            ),
            SizedBox(
              height: size.width/1.6,
              width: size.width / 1,
              child: Wrap(
                spacing: size.width/5.76,
                runSpacing: size.width/23.22,
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
              height: size.width/11.33,
            ),

            //! wrap number two with 4 container and animation with shimmer have icon, title and description
            Text(
              'Why Choose CCW',
              style: TextStyle(
                  fontSize: size.width/40,
                  color: MyColor.secendry,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height:  size.width/20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: size.width /18,
              spacing: size.width /32,
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
              height: size.width/8.78,
            ),
            //! footer with logo and map
            Divider(
              indent: size.width / 10,
              thickness: 1,
              color: MyColor.white,
              endIndent: size.width / 10,
            ),
            SizedBox(
              height: size.width/12.1,
            ),
            Footer(size: size),
            SizedBox(
              height: size.width/19.72,
            ),
            Container(
              height: size.width/24.40,
              width: size.width/24.40,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: size.width/60,
            ),
            Text(
              'Copyright © 2019. Crafted with love.',
              style: TextStyle(
                color: MyColor.white,
                fontSize: size.width/90,
              ),
            ),
            SizedBox(
              height: size.width/13.98,
            )
          ],
        ),
      ),
    );
  }
}
