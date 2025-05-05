import 'dart:math';

import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_footer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class McontactUsScreen extends StatefulWidget {
  const McontactUsScreen({super.key});

  @override
  State<McontactUsScreen> createState() => _McontactUsScreenState();
}

final List<String> disposableDomains = [
  '10minutemail.com',
  'tempmail.com',
  'mailinator.com',
  'guerrillamail.com',
  'yopmail.com',
  'trashmail.com',
  'fakeinbox.com',
  'getnada.com',
  'mintemail.com',
  'mytemp.email',
  'emailondeck.com',
  'throwawaymail.com',
  'temp-mail.org',
  'maildrop.cc',
  'dispostable.com',
  'moakt.com',
  'inboxkitten.com',
  'spamgourmet.com',
  'spam4.me',
  'fakemail.net',
  'tempinbox.com',
  'emailtemporario.com.br',
  'instantemailaddress.com',
  'mailnesia.com',
  'tmail.ws',
  'anonbox.net',
  'sharklasers.com',
  'jetable.org',
  'mailcatch.com',
  '0wnd.net',
  'spamdecoy.net',
  'disposeamail.com',
  'nowmymail.com',
  'easytrashmail.com',
  'getairmail.com',
];

class _McontactUsScreenState extends State<McontactUsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  bool isSending = false;
  final Dio dio = Dio();

  late int num1;
  late int num2;

  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }

  void _generateCaptcha() {
    setState(() {
      final random = Random();
      num1 = random.nextInt(90) + 10; // 10 تا 99
      num2 = random.nextInt(90) + 10;
    });
  }

  bool isDisposableEmail(String email) {
    final domain = email.split('@').last.toLowerCase();
    return disposableDomains.contains(domain);
  }

  String? validateEmail(String email) {
    if (email.trim().length < 6) {
      return 'Your email must be at least 6 characters long.';
    }

    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format.';
    }

    final localPart = email.split('@').first;
    if (localPart.length < 6) {
      return 'Your email local part must be at least 6 characters long.';
    }

    return null;
  }

  Future<void> sendMessage() async {
    final String email = emailController.text.trim();
    final String message = messageController.text.trim();
    final String captchaInput = captchaController.text.trim();
    final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final emailError = validateEmail(email);
    if (emailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(emailError)));
      return;
    }

    if (message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('Please enter a message.')),
      );
      return;
    }

    if (captchaInput != (num1 + num2).toString()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('The captcha is incorrect.')),
      );
      return;
    }
    if (isDisposableEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('Please use a valid email address.')),
      );
      return;
    }

    setState(() => isSending = true);

    try {
      final checkResponse = await dio.get(
        'https://pocketbase-5i4fn3.chbk.app/api/collections/messages/records',
        queryParameters: {
          'filter': 'email = "$email" && date = "$today"',
        },
      );

      final List items = checkResponse.data['items'];
      if (items.isNotEmpty) {
        setState(() => isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('You have already sent a message today.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final response = await dio.post(
        'https://pocketbase-5i4fn3.chbk.app/api/collections/messages/records',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          'email': email,
          'message': message,
          'date': today,
        },
      );

      setState(() => isSending = false);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emailController.clear();
        messageController.clear();
        captchaController.clear();
        _generateCaptcha();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            content: Text('Message sent successfully!'),
          ),
        );
      }
    } on DioException catch (e) {
      setState(() => isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('An error occurred while sending the message.'),
          backgroundColor: Colors.red,
        ),
      );
      print('Dio error: ${e.response?.data}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height:
                      ResponsiveMobileUtils.getResponsiveSize(context, 1140),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        'assets/images/recources.png',
                        height: ResponsiveMobileUtils.getResponsiveSize(
                            context, 377),
                        width: ResponsiveMobileUtils.getResponsiveSize(
                            context, 402),
                        fit: BoxFit.cover,
                      ),
                      MobileAppBar(),
                      Positioned(
                        top: ResponsiveMobileUtils.getResponsiveSize(
                            context, 164),
                        child: Column(
                          spacing: ResponsiveMobileUtils.getResponsiveSize(
                              context, 10),
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveMobileUtils.getResponsiveSize(
                                          context, 24),
                                  color: MyColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 184),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Any question or remarks? Just write us a message!',
                                style: TextStyle(
                                    fontSize:
                                        ResponsiveMobileUtils.getResponsiveSize(
                                            context, 14),
                                    color: MyColor.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //?contact info container
                      Positioned(
                        top: ResponsiveMobileUtils.getResponsiveSize(
                            context, 272),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Container(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 949),
                            width: ResponsiveMobileUtils.getResponsiveSize(
                                context, 320),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.topCenter,
                                  colors: MyColor.cartServiceColor),
                              borderRadius: BorderRadius.circular(
                                  ResponsiveMobileUtils.getResponsiveSize(
                                      context, 5)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: ResponsiveMobileUtils.getResponsiveSize(
                                      context, 5)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        ResponsiveMobileUtils.getResponsiveSize(
                                      context,
                                      397,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Container(
                                          height: ResponsiveMobileUtils
                                              .getResponsiveSize(context, 397),
                                          width: ResponsiveMobileUtils
                                              .getResponsiveSize(context, 310),
                                          decoration: BoxDecoration(
                                            color: Color(0xff081A1A),
                                            borderRadius: BorderRadius.circular(
                                                ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 3)),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 15),
                                              ),
                                              Text(
                                                'Contact Information',
                                                style: TextStyle(
                                                    fontSize:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 20),
                                                    color: MyColor.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 6),
                                              ),
                                              Text(
                                                'Say something to start a live chat!',
                                                style: TextStyle(
                                                    fontSize:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 11),
                                                    color: MyColor.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              SizedBox(
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 20),
                                              ),
                                              Column(
                                                spacing: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 25),
                                                children: [
                                                  Column(
                                                    spacing:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 15),
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/call.png',
                                                        width: ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 24),
                                                        height:
                                                            ResponsiveMobileUtils
                                                                .getResponsiveSize(
                                                                    context,
                                                                    24),
                                                      ),
                                                      Text(
                                                        '+1012 3456 789',
                                                        style: TextStyle(
                                                            fontSize:
                                                                ResponsiveMobileUtils
                                                                    .getResponsiveSize(
                                                                        context,
                                                                        12),
                                                            color:
                                                                MyColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    spacing:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 12),
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/email.png',
                                                        width: ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 24),
                                                        height:
                                                            ResponsiveMobileUtils
                                                                .getResponsiveSize(
                                                                    context,
                                                                    24),
                                                      ),
                                                      Text(
                                                        'demo@gmail.com',
                                                        style: TextStyle(
                                                            fontSize:
                                                                ResponsiveMobileUtils
                                                                    .getResponsiveSize(
                                                                        context,
                                                                        12),
                                                            color:
                                                                MyColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    spacing:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 12),
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/location.png',
                                                        width: ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 24),
                                                        height:
                                                            ResponsiveMobileUtils
                                                                .getResponsiveSize(
                                                                    context,
                                                                    24),
                                                      ),
                                                      SizedBox(
                                                        width: ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 221),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          '132 Dartmouth Street Boston, Massachusetts 02156 United States',
                                                          style: TextStyle(
                                                              fontSize: ResponsiveMobileUtils
                                                                  .getResponsiveSize(
                                                                      context,
                                                                      12),
                                                              color:
                                                                  MyColor.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 30),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                spacing: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 24),
                                                children: [
                                                  Container(
                                                    height:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 30),
                                                    width: ResponsiveMobileUtils
                                                        .getResponsiveSize(
                                                            context, 30),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            MyColor.secendry),
                                                  ),
                                                  Container(
                                                    height:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 30),
                                                    width: ResponsiveMobileUtils
                                                        .getResponsiveSize(
                                                            context, 30),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: MyColor.white),
                                                  ),
                                                  Container(
                                                    height:
                                                        ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context, 30),
                                                    width: ResponsiveMobileUtils
                                                        .getResponsiveSize(
                                                            context, 30),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            MyColor.secendry),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                            'assets/images/greyBlur.png',
                                            fit: BoxFit.cover,
                                            width: ResponsiveMobileUtils
                                                .getResponsiveSize(
                                                    context, 100),
                                            height: ResponsiveMobileUtils
                                                .getResponsiveSize(
                                                    context, 100)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ResponsiveMobileUtils.getResponsiveSize(
                                            context, 30),
                                  ),
                                  Column(
                                    spacing:
                                        ResponsiveMobileUtils.getResponsiveSize(
                                            context, 30),
                                    children: [
                                      SizedBox(
                                        height: ResponsiveMobileUtils
                                            .getResponsiveSize(context, 55),
                                        width: ResponsiveMobileUtils
                                            .getResponsiveSize(context, 278),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: emailController,
                                          style: TextStyle(
                                              color: Colors
                                                  .white), // رنگ متن تایپ شده
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior
                                                    .auto, // رنگ لیبل
                                            hintText: 'Write your email',
                                            hintStyle: TextStyle(
                                                color:
                                                    Colors.white), // رنگ hint
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .white), // خط زیر وقتی غیرفعال است
                                            ),

                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .white), // خط زیر وقتی فعال است
                                            ),
                                          ),
                                          cursorColor:
                                              Colors.white, // رنگ مکان‌نما
                                        ),
                                      ),
                                      SizedBox(
                                        height: ResponsiveMobileUtils
                                            .getResponsiveSize(context, 55),
                                        width: ResponsiveMobileUtils
                                            .getResponsiveSize(context, 278),
                                        child: TextField(
                                          controller: messageController,
                                          style: TextStyle(
                                              color: Colors
                                                  .white), // رنگ متن تایپ شده
                                          decoration: InputDecoration(
                                            labelText: 'Message',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior
                                                    .auto, // رنگ لیبل
                                            hintText: 'Write your message',
                                            hintStyle: TextStyle(
                                                color:
                                                    Colors.white70), // رنگ hint
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .white), // خط زیر وقتی غیرفعال است
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .white), // خط زیر وقتی فعال است
                                            ),
                                          ),
                                          cursorColor:
                                              Colors.white, // رنگ مکان‌نما
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: ResponsiveMobileUtils
                                            .getResponsiveSize(context, 10),
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: ResponsiveMobileUtils
                                                .getResponsiveSize(context, 7),
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 48),
                                                width: ResponsiveMobileUtils
                                                    .getResponsiveSize(
                                                        context, 190),
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .transparent, // بدون رنگ پس‌زمینه
                                                  border: Border.all(
                                                    color: Colors
                                                        .white, // رنگ استروک
                                                    width: 1, // ضخامت خط
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context,
                                                                  10)), // اختیاری، برای گوشه‌های گرد
                                                ),
                                                child: Text(
                                                  '$num1 + $num2',
                                                  style: TextStyle(
                                                      fontSize:
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context, 20),
                                                      color: Colors.white),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: _generateCaptcha,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: ResponsiveMobileUtils
                                                      .getResponsiveSize(
                                                          context, 48),
                                                  width: ResponsiveMobileUtils
                                                      .getResponsiveSize(
                                                          context, 81),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .bottomRight,
                                                        end: Alignment.topLeft,
                                                        colors: [
                                                          MyColor.secendry,
                                                          MyColor.third
                                                        ]),
                                                    borderRadius: BorderRadius
                                                        .circular(ResponsiveMobileUtils
                                                            .getResponsiveSize(
                                                                context,
                                                                10)), // اختیاری، برای گوشه‌های گرد
                                                  ),
                                                  child: Image.asset(
                                                      'assets/images/refresh.png',
                                                      fit: BoxFit.cover,
                                                      width:
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context,
                                                                  24),
                                                      height:
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context, 24)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: ResponsiveMobileUtils
                                                .getResponsiveSize(context, 50),
                                            width: ResponsiveMobileUtils
                                                .getResponsiveSize(
                                                    context, 278),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: captchaController,
                                              textAlign: TextAlign
                                                  .center, // وسط‌چین کردن متن و hint به صورت افقی
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter the correct answer',
                                                hintStyle: TextStyle(
                                                  fontSize:
                                                      ResponsiveMobileUtils
                                                          .getResponsiveSize(
                                                              context, 14),
                                                  color: MyColor.grey,
                                                ),
                                                fillColor: Colors.transparent,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context, 10)),
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context, 10)),
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 2),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  vertical: ResponsiveMobileUtils
                                                      .getResponsiveSize(
                                                          context,
                                                          20), // برای تراز عمودی
                                                  horizontal: ResponsiveMobileUtils
                                                      .getResponsiveSize(
                                                          context,
                                                          10), // برای تراز افقی
                                                ),
                                                // برای تراز عمودی
                                                isDense:
                                                    true, // فضای کلی کمتر می‌شه و به تراز کمک می‌کنه
                                              ),
                                              cursorColor: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ResponsiveMobileUtils
                                                .getResponsiveSize(context, 46),
                                          ),
                                          GestureDetector(
                                            onTap: sendMessage,
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: ResponsiveMobileUtils
                                                    .getResponsiveSize(context,
                                                        38),
                                                width:
                                                    ResponsiveMobileUtils
                                                        .getResponsiveSize(context,
                                                            278),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.bottomRight,
                                                      end: Alignment.topLeft,
                                                      colors: MyColor.linear),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ResponsiveMobileUtils
                                                              .getResponsiveSize(
                                                                  context,
                                                                  3.2)), // اختیاری، برای گوشه‌های گرد
                                                ),
                                                child: isSending
                                                    ? Center(
                                                      child:
                                                          SizedBox(
                                                            height: ResponsiveMobileUtils.getResponsiveSize(context, 20),
                                                            width: ResponsiveMobileUtils.getResponsiveSize(context, 20),
                                                            child: CircularProgressIndicator(
                                                                strokeAlign: 1,
                                                                strokeWidth: 2,
                                                                
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                    )
                                                    : Text('Send Message',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                ResponsiveMobileUtils
                                                                    .getResponsiveSize(
                                                                        context,
                                                                        13),
                                                            color:
                                                                MyColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: ResponsiveMobileUtils.getResponsiveSize(
                                context, 80),
                            left: ResponsiveMobileUtils.getResponsiveSize(
                                context, 70),
                            child: Image.asset(
                              'assets/images/flyingLetter.png',
                              width: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 104.4),
                              height: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 52.15),
                              fit: BoxFit.cover,
                            ),
                          )
                        ]).animate().slideX().shimmer(duration: 1.5.seconds),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 100),
                ),
                MobileFooter()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
