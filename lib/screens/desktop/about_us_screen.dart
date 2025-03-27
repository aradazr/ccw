import 'package:ccw/constans/my_color.dart';
import 'package:ccw/widgets/app_bar.dart';
import 'package:ccw/widgets/our_firm_and_other.dart';
import 'package:flutter/material.dart';

class DaboutUsScreen extends StatelessWidget {
  const DaboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppbar(
              size: size,
              homeStyle: TextStyle(
                  fontSize: size.width / 90,
                  color: MyColor.white,
                  fontWeight: FontWeight.w200),
              aboutStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  decorationColor: MyColor.primary,
                  fontSize: size.width / 90,
                  color: MyColor.primary,
                  fontWeight: FontWeight.w200),
              servicesStyle: TextStyle(
                  fontSize: size.width / 90,
                  color: MyColor.white,
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
            SizedBox(
              height: size.width / 16.36,
            ),
            SizedBox(
              width: size.width / 1,
              height: size.width / 1.8,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    right: size.width / 24,
                    child: Image.asset(
                      'assets/images/curvShape.png',
                      height: size.width / 1.3,
                      width: size.width / 1.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: size.width / 14,
                    right: size.width / 8,
                    child: Image.asset(
                      'assets/images/aboutusPeople.png',
                      fit: BoxFit.cover,
                      width: size.width / 2.8,
                      height: size.width / 2.8,
                    ),
                  ),
                  Positioned(
                    left: size.width / 9.53,
                    top: size.width / 9.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OUR TEAM',
                          style: TextStyle(
                              fontSize: size.width / 103,
                              color: MyColor.secendry,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: size.width / 84.70,
                        ),
                        SizedBox(
                          width: size.width / 3.14,
                          child: Text(
                            'Experience and integrity by our team',
                            style: TextStyle(
                                fontSize: size.width / 40,
                                color: MyColor.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.width / 60,
                        ),
                        SizedBox(
                          width: size.width / 3.14,
                          child: Text(
                            'Our team is made up of experienced CPAs who are dedicated to helping clients achieve financial clarity and success. We take a collaborative approach to problem-solving, ensuring that every client benefits from our collective expertise.',
                            style: TextStyle(
                                height: 1.9,
                                fontSize: size.width / 80,
                                color: MyColor.white,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        SizedBox(
                          height: size.width / 36.92,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: size.width / 7.78,
                              height: size.width / 30,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(2000),
                                border: Border.all(
                                  width: 2,
                                  color: Colors
                                      .transparent, // خود border رنگ نمی‌دیم چون می‌خوایم gradient بشه
                                ),
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Color(0xffE3C985),
                                    Color(0xffA69464)
                                  ],
                                ).createShader(bounds),
                                child: Container(
                                  width: size.width / 7.78,
                                  height: size.width / 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2000),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors
                                          .white, // این رنگ میره زیر gradient
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
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
                                        fontSize: size.width / 90,
                                        color: MyColor.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 180,
                                ),
                                Image.asset(
                                  'assets/images/arrow.png',
                                  height: size.width / 90,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.width / 12.97,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width / 10.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT US',
                      style: TextStyle(
                          fontSize: size.width / 120,
                          color: MyColor.secendry,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.width / 96,
                    ),
                    SizedBox(
                      width: size.width / 3.95,
                      child: Text(
                          'Comprehensive and Expert Financial Solutions, Carefully Tailored to Meet Your Unique Needs and Long-Term Goals',
                          style: TextStyle(
                            fontSize: size.width / 50,
                            color: MyColor.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width / 5.627,
                ),
                SizedBox(
                  width: size.width / 3.1,
                  child: Text(
                      'At CCW CPA, we are more than just accountants—we are strategic partners dedicated to your financial success. With decades of experience in tax, accounting, and business advisory services, we help individuals and businesses navigate the complexities of financial management with clarity and confidence.As a firm built on trust, expertise, and innovation, we prioritize personalized service, ensuring that every client receives solutions tailored to their specific needs. Whether you’re a business owner seeking tax optimization, an investor looking for strategic planning, or an individual in need of financial guidance, we are here to help you make informed decisions with confidence.',
                      style: TextStyle(
                        fontSize: size.width / 100.488,
                        color: MyColor.white,
                        fontWeight: FontWeight.w100,
                      )),
                )
              ],
            ),
            SizedBox(
              height: size.width / 23.51,
            ),
            Image.asset('assets/images/space.png',
                width: size.width / 1.188,
                height: size.width / 2.23,
                fit: BoxFit.cover),
            SizedBox(
              height: size.width / 9.05,
            ),
            Column(
              children: [
                OurFirmAndOther(
                  size: size,
                  title: 'Our Firm',
                  description: 'CCW CPA is a professional accounting firm with a reputation for excellence. Under the leadership of Parham Alizadehkia, CPA, our firm continues to build on a strong foundation, ensuring seamless transitions and continuity of service...',
                  image: 'assets/images/ourFirm.png',
                  colors: [ Color(0xFF0E0E0E), const Color(0xFF0E2E2E)],
                ),
                SizedBox(height: size.height / 49.65,),
                OurFirmAndOther(
                  size: size,
                  title: 'Our Misson',
                  description: 'Our mission is to empower businesses and individuals with trusted financial guidance, expert accounting services, and personalized tax strategies. We are committed to delivering solutions that help our clients achieve their financial goals while maintaining the...',
                  image: 'assets/images/ourFirm.png',
                  colors: [Color(0xFF0E0E0E), const Color(0xFF221B0D)],
                ),
                SizedBox(height: size.height / 49.65,),
                OurFirmAndOther(
                  size: size,
                  title: 'Our Vision',
                  description: 'We strive to be the premier CPA firm, recognized for driving financial success and growth for our clients. By continually innovating and evolving our services, we ensure that businesses and individuals receive forward-thinking, ethical, and expert financial advice tailored to their needs.',
                  image: 'assets/images/ourFirm.png',
                  colors: [Color(0xFF0E0E0E), const Color(0xFF1F272B)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
