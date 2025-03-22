import 'package:flutter/material.dart';

class DhomeScreen extends StatelessWidget {
  const DhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 1000,
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ccwLogo.png',
                            width: size.width / 18.7,
                          ),
                          SizedBox(
                            width: size.width / 2.3,
                          ),
                          Row(
                            spacing: 24,
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 131,
                                height: 48,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.green,
                                          Colors.greenAccent
                                        ]),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'Client Portal',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
                              color: Colors.white,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                            )),
                        SizedBox(height: 39),
                        Row(
                          spacing: 25,
                          children: [
                            Container(
                                height: 56,
                                width: 196,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(100))),
                            Container(
                              height: 56,
                              width: 196,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.green,
                                        Colors.greenAccent
                                      ]),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            Container(
                                height: 56,
                                width: 196,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(100))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Positioned(
                    top: 515,
                    child: Wrap(
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 19,
                      
                      children: [ 
                        Container(
                          height: 322,
                          width: 302,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(13)),
                        ),
                        Container(
                          height: 322,
                          width: 302,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(13)),
                        ),
                        Container(
                          height: 322,
                          width: 302,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(13)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Who We Help',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'At CCW CPA, we specialize in providing expert accounting and tax services for:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 109,
            ),
            Wrap(
              spacing: 250,
              runSpacing: 62,
              alignment: WrapAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Color(0xff010B06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/ownerIcon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Owner-Operators & Entrepreneurs',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: size.width / 3.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Stay focused on running your business while we handle your financials',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Color(0xff010B06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/ownerIcon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Owner-Operators & Entrepreneurs',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: size.width / 3.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Stay focused on running your business while we handle your financials',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Color(0xff010B06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/ownerIcon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Owner-Operators & Entrepreneurs',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: size.width / 3.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Stay focused on running your business while we handle your financials',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Color(0xff010B06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/ownerIcon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Owner-Operators & Entrepreneurs',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: size.width / 3.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Stay focused on running your business while we handle your financials',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Color(0xff010B06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/ownerIcon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Owner-Operators & Entrepreneurs',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: size.width / 3.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Stay focused on running your business while we handle your financials',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 127,
            ),
            Text(
              'Why Choose CCW',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 55,),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 90,
              spacing: 45,
              children: [
                Stack(
                  clipBehavior: Clip.none, // جلوگیری از برش تصویر
                  alignment: Alignment.topCenter,
                  children: [
                    // کانتینر برای بوردر گرادینت
                    Container(
                      height: 200 +
                          6, // کمی بزرگ‌تر برای نمایش بوردر
                      width: 457 + 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            55), // کمی بزرگ‌تر از کانتینر اصلی
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff008042),
                          ],
                        ),
                      ),
                    ),
                
                    // کانتینر اصلی بدون تغییر
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.all(1.5), // ضخامت بوردر
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff111111), Color(0xff081A1A)],
                          ),
                        ),
                        child: Column(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Personalized Tax & Financial Strategies',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            SizedBox(
                                width: 300,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'No two clients are alike, and we develop customized financial solutions to fit your needs.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                
                    // قرار دادن تصویر روی لبه کانتینر
                    Positioned(
                      top: -37, // تصویر را بالاتر از کانتینر قرار می‌دهد
                      child: Image.asset(
                        'assets/images/eyeIcon.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none, // جلوگیری از برش تصویر
                  alignment: Alignment.topCenter,
                  children: [
                    // کانتینر برای بوردر گرادینت
                    Container(
                      height: 200 +
                          6, // کمی بزرگ‌تر برای نمایش بوردر
                      width: 457 + 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            55), // کمی بزرگ‌تر از کانتینر اصلی
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff008042),
                          ],
                        ),
                      ),
                    ),
                
                    // کانتینر اصلی بدون تغییر
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.all(1.5), // ضخامت بوردر
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff111111), Color(0xff081A1A)],
                          ),
                        ),
                        child: Column(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Personalized Tax & Financial Strategies',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            SizedBox(
                                width: 300,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'No two clients are alike, and we develop customized financial solutions to fit your needs.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                
                    // قرار دادن تصویر روی لبه کانتینر
                    Positioned(
                      top: -37, // تصویر را بالاتر از کانتینر قرار می‌دهد
                      child: Image.asset(
                        'assets/images/eyeIcon.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none, // جلوگیری از برش تصویر
                  alignment: Alignment.topCenter,
                  children: [
                    // کانتینر برای بوردر گرادینت
                    Container(
                      height: 200 +
                          6, // کمی بزرگ‌تر برای نمایش بوردر
                      width: 457 + 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            55), // کمی بزرگ‌تر از کانتینر اصلی
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff008042),
                          ],
                        ),
                      ),
                    ),
                
                    // کانتینر اصلی بدون تغییر
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.all(1.5), // ضخامت بوردر
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff111111), Color(0xff081A1A)],
                          ),
                        ),
                        child: Column(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Personalized Tax & Financial Strategies',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            SizedBox(
                                width: 300,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'No two clients are alike, and we develop customized financial solutions to fit your needs.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                
                    // قرار دادن تصویر روی لبه کانتینر
                    Positioned(
                      top: -37, // تصویر را بالاتر از کانتینر قرار می‌دهد
                      child: Image.asset(
                        'assets/images/eyeIcon.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none, // جلوگیری از برش تصویر
                  alignment: Alignment.topCenter,
                  children: [
                    // کانتینر برای بوردر گرادینت
                    Container(
                      height: 200 +
                          6, // کمی بزرگ‌تر برای نمایش بوردر
                      width: 457 + 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            55), // کمی بزرگ‌تر از کانتینر اصلی
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff051D12),
                            Color(0xff008042),
                          ],
                        ),
                      ),
                    ),
                
                    // کانتینر اصلی بدون تغییر
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.all(1.5), // ضخامت بوردر
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff111111), Color(0xff081A1A)],
                          ),
                        ),
                        child: Column(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Personalized Tax & Financial Strategies',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            SizedBox(
                                width: 300,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'No two clients are alike, and we develop customized financial solutions to fit your needs.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                
                    // قرار دادن تصویر روی لبه کانتینر
                    Positioned(
                      top: -37, // تصویر را بالاتر از کانتینر قرار می‌دهد
                      child: Image.asset(
                        'assets/images/eyeIcon.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
