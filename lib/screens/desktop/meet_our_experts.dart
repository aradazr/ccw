import 'package:ccw/constans/my_color.dart';
import 'package:ccw/widgets/meet_our_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DmeetOurExperts extends StatelessWidget {
  const DmeetOurExperts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.width / 0.95,
          width: size.width / 1,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -size.width / 2.8,
                child: Image.asset(
                  'assets/images/greenBlur.png',
                  height: size.width / 1.3,
                  width: size.width / 1.3,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: size.width / 25,
                left: size.width / 20.281,
                child: Image.asset(
                  'assets/images/circularArrow.png',
                  fit: BoxFit.cover,
                  height: size.width / 30,
                  width: size.width / 30,
                ),
              ),
              Positioned(
                top: size.width / 25,
                child: Column(
                  children: [
                    Text(
                      'Meet our Experts',
                      style: TextStyle(
                          color: MyColor.white,
                          fontSize: size.width / 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.width / 60,
                    ),
                    SizedBox(
                      width: size.width / 2.2,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Discover the passionate of innovators, strategist, and customer success professionals working tirelessly to help you achieve your goals',
                        style: TextStyle(
                            color: MyColor.white,
                            fontSize: size.width / 80,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: size.width / 4.948,
                  child: Column(
                    spacing: size.width / 90,
                    children: [
                      ...[
                        MeetOurTeam(
                          size: size,
                          image: 'assets/images/parham.png',
                          name: 'Parham Alizadehkia',
                          title: 'CPA – Partner',
                          subTitle:
                              'Parham Alizadehkia is an experienced CPA with a decade of experience in public practice, specializing in taxation and financial management. Having worked closely with numerous successful enterprises across Vancouver, he is committed to helping businesses achieve long-term financial success. Parham’s expertise lies in delivering comprehensive tax strategies that optimize business performance, allowing clients to focus on operational excellence. His dedication to sound financial practices and strategic tax planning ensures that businesses not only meet compliance requirements but also thrive in a competitive landscape.',
                        ),
                        MeetOurTeam(
                          size: size,
                          image: 'assets/images/parham.png',
                          name: 'Brian Cawley, CPA, CA',
                          title: 'Retired Partner (Advisor)',
                          subTitle:
                              'With over 40 years of experience, Brian Cawley has been a trusted advisor to owner-operated businesses since 1985. His extensive tax knowledge and deep understanding of the financial challenges faced by entrepreneurs have made him a cornerstone in the industry. Brian’s commitment to providing tailored solutions has helped countless business owners navigate the complexities of taxation and financial planning. As he transitions into retirement, his legacy continues through the firm, ensuring that clients receive the same level of expertise and personalized service.',
                        ),
                        MeetOurTeam(
                          size: size,
                          image: 'assets/images/parham.png',
                          name: 'Kantaro Horino',
                          title: 'CPA Student',
                          subTitle:
                              'Kantaro Horino is a dedicated CPA student with a strong passion for accounting and tax services. Born and raised in Vancouver, BC, he is fluent in both English and Japanese. He holds a Business degree from the University of Victoria and has gained valuable experience through multiple internships before returning to CCW CPA as a tax accountant to pursue his CPA designation. With a keen eye for detail and a deep understanding of financial management and tax preparation, Kantaro is committed to delivering high-quality services by ensuring accurate financial reporting and full regulatory compliance. Under the mentorship of seasoned professionals, he continues to develop his expertise in taxation and financial advisory, making him a valuable asset to both the firm and our clients.',
                        ),
                        MeetOurTeam(
                          size: size,
                          image: 'assets/images/parham.png',
                          name: 'Colette Lam',
                          title: 'Administrative Specialist',
                          subTitle:
                              'Since joining CCW CPA in 2013, Colette Lam has been a key pillar of stability and efficiency within the firm. With years of experience in public practice, she plays a crucial role in ensuring the seamless operation of our firm, particularly during the busiest seasons. Highly organized and detail-oriented, Colette excels in problem-solving, effective communication, and client service, consistently going beyond the scope of her administrative role to support both the team and our clients. Her deep knowledge of administrative processes and unwavering commitment to excellence contribute significantly to the professionalism and success of CCW CPA.',
                        ),
                      ].asMap().entries.map((entry) {
                        int index = entry.key;
                        var widget = entry.value;
                        return widget
                            .animate()
                            .fade(duration: 500.ms, delay: (index * 400).ms)
                            .slideX(
                                begin: 1,
                                end: 0,
                                duration: 400.ms,
                                curve: Curves.easeOut)
                            .shimmer(
                                delay: (index * 400 + 100).ms,
                                duration: 1500.ms);
                      },
                      ),
                    ],
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
