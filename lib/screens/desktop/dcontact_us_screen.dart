import 'dart:math';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/widgets/desktop/app_bar.dart';
import 'package:ccw/widgets/desktop/footer.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class DcontactUsScreen extends StatefulWidget {
  const DcontactUsScreen({super.key});

  @override
  State<DcontactUsScreen> createState() => _DcontactUsScreenState();
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

class _DcontactUsScreenState extends State<DcontactUsScreen> {
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
    if (email.trim().length < 2) {
      return 'Your email must be at least 6 characters long.';
    }

    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format.';
    }

    final localPart = email.split('@').first;
    if (localPart.length < 2) {
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
        'https://pocketbase-ccw.chbk.app/api/collections/messages/records',
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
        'https://pocketbase-ccw.chbk.app/api/collections/messages/records',
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 1055),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/contactUs.png',
                      fit: BoxFit.cover,
                      width: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 1440),
                      height: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 583)),
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
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                    resourcesStyle: TextStyle(
                        fontSize: size.width / 90,
                        color: MyColor.white,
                        fontWeight: FontWeight.w200),
                    contactStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                        decorationColor: MyColor.primary,
                        fontSize: size.width / 90,
                        color: MyColor.primary,
                        fontWeight: FontWeight.w200),
                  ),
                  Positioned(
                    top: ResponsiveDesktopUtils.getResponsiveSize(context, 230),
                    child: Column(
                      spacing:
                          ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveDesktopUtils.getResponsiveSize(
                                      context, 48),
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 590),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Any question or remarks? Just write us a message!',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 24),
                                color: MyColor.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: ResponsiveDesktopUtils.getResponsiveSize(context, 388),
                    child: Container(
                      height: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 667),
                      width: ResponsiveDesktopUtils.getResponsiveSize(
                          context, 1196),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: MyColor.cartServiceColor),
                        borderRadius: BorderRadius.circular(
                            ResponsiveDesktopUtils.getResponsiveSize(
                                context, 10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: ResponsiveDesktopUtils.getResponsiveSize(
                                  context, 647),
                              width: ResponsiveDesktopUtils.getResponsiveSize(
                                  context, 491),
                              decoration: BoxDecoration(
                                color: Color(0xff081A1A),
                                borderRadius: BorderRadius.circular(
                                  ResponsiveDesktopUtils.getResponsiveSize(
                                      context, 5),
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: ResponsiveDesktopUtils
                                          .getResponsiveSize(context, 40),
                                      top: ResponsiveDesktopUtils
                                          .getResponsiveSize(context, 40),
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              spacing: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 10),
                                              children: [
                                                SizedBox(
                                                  width: ResponsiveDesktopUtils
                                                      .getResponsiveSize(
                                                          context, 491),
                                                ),
                                                Text(
                                                  'Contact Information',
                                                  style: TextStyle(
                                                      fontSize:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 28),
                                                      color: MyColor.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.start,
                                                  'Say something to start a live chat!',
                                                  style: TextStyle(
                                                      fontSize:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 18),
                                                      color: MyColor.white,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 111),
                                            ),
                                            Column(
                                              spacing: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 50),
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/call.png',
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                      height:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 25),
                                                    ),
                                                    Text('(604) 731-1191',
                                                        style: TextStyle(
                                                          fontSize:
                                                              ResponsiveDesktopUtils
                                                                  .getResponsiveSize(
                                                                      context,
                                                                      16),
                                                          color: MyColor.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/email.png',
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                      height:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 25),
                                                    ),
                                                    Text('info@ccwcpa.ca',
                                                        style: TextStyle(
                                                          fontSize:
                                                              ResponsiveDesktopUtils
                                                                  .getResponsiveSize(
                                                                      context,
                                                                      16),
                                                          color: MyColor.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/location.png',
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                      height:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 25),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 288),
                                                      child: Text(
                                                          'Unit -M-9, 601 West Broadway, Vancouver, V5Z 4C2',
                                                          style: TextStyle(
                                                            fontSize:
                                                                ResponsiveDesktopUtils
                                                                    .getResponsiveSize(
                                                                        context,
                                                                        16),
                                                            color:
                                                                MyColor.white,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: ResponsiveDesktopUtils
                                              .getResponsiveSize(context, 159),
                                        ),
                                        Row(
                                          spacing: ResponsiveDesktopUtils
                                              .getResponsiveSize(context, 24),
                                          children: [
                                            Container(
                                              height: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              width: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: MyColor.secendry),
                                            ),
                                            Container(
                                              height: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              width: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: MyColor.white),
                                            ),
                                            Container(
                                              height: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              width: ResponsiveDesktopUtils
                                                  .getResponsiveSize(
                                                      context, 30),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: MyColor.secendry),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset('assets/images/greyBlur.png',
                                      fit: BoxFit.cover,
                                      width: ResponsiveDesktopUtils
                                          .getResponsiveSize(context, 200),
                                      height: ResponsiveDesktopUtils
                                          .getResponsiveSize(context, 200)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ResponsiveDesktopUtils.getResponsiveSize(
                                      context, 160),
                                  left:
                                      ResponsiveDesktopUtils.getResponsiveSize(
                                          context, 40)),
                              child: Column(
                                spacing:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 65),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 55),
                                    width: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 595),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      style: TextStyle(
                                          color:
                                              Colors.white), // رنگ متن تایپ شده
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .auto, // رنگ لیبل
                                        hintText: 'Write your email',
                                        hintStyle: TextStyle(
                                            color: Colors.white), // رنگ hint
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
                                      cursorColor: Colors.white, // رنگ مکان‌نما
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 55),
                                    width: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 595),
                                    child: TextField(
                                      controller: messageController,
                                      style: TextStyle(
                                          color:
                                              Colors.white), // رنگ متن تایپ شده
                                      decoration: InputDecoration(
                                        labelText: 'Message',
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior
                                                .auto, // رنگ لیبل
                                        hintText: 'Write your message',
                                        hintStyle: TextStyle(
                                            color: Colors.white70), // رنگ hint
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
                                      cursorColor: Colors.white, // رنگ مکان‌نما
                                    ),
                                  ),
                                  Row(
                                    spacing: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 110),
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        spacing: ResponsiveDesktopUtils
                                            .getResponsiveSize(context, 10),
                                        children: [
                                          Row(
                                            spacing: ResponsiveDesktopUtils
                                                .getResponsiveSize(context, 7),
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: ResponsiveDesktopUtils
                                                    .getResponsiveSize(
                                                        context, 48),
                                                width: ResponsiveDesktopUtils
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
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context,
                                                                  10)), // اختیاری، برای گوشه‌های گرد
                                                ),
                                                child: Text(
                                                  '$num1 + $num2',
                                                  style: TextStyle(
                                                      fontSize:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 20),
                                                      color: Colors.white),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: _generateCaptcha,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: ResponsiveDesktopUtils
                                                      .getResponsiveSize(
                                                          context, 48),
                                                  width: ResponsiveDesktopUtils
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
                                                    borderRadius: BorderRadius.circular(
                                                        ResponsiveDesktopUtils
                                                            .getResponsiveSize(
                                                                context,
                                                                10)), // اختیاری، برای گوشه‌های گرد
                                                  ),
                                                  child: Image.asset(
                                                      'assets/images/refresh.png',
                                                      fit: BoxFit.cover,
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24),
                                                      height:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 24)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: ResponsiveDesktopUtils
                                                .getResponsiveSize(context, 50),
                                            width: ResponsiveDesktopUtils
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
                                                      ResponsiveDesktopUtils
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
                                                          ResponsiveDesktopUtils
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
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 10)),
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 2),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  vertical: ResponsiveDesktopUtils
                                                      .getResponsiveSize(
                                                          context,
                                                          20), // برای تراز عمودی
                                                  horizontal: ResponsiveDesktopUtils
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
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: sendMessage,
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: ResponsiveDesktopUtils
                                                .getResponsiveSize(context, 50),
                                            width: ResponsiveDesktopUtils
                                                .getResponsiveSize(
                                                    context, 214),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomRight,
                                                  end: Alignment.topLeft,
                                                  colors: MyColor.linear),
                                              borderRadius: BorderRadius.circular(
                                                  ResponsiveDesktopUtils
                                                      .getResponsiveSize(
                                                          context,
                                                          10)), // اختیاری، برای گوشه‌های گرد
                                            ),
                                            child: isSending
                                                ? Center(
                                                    child: SizedBox(
                                                      height:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 20),
                                                      width:
                                                          ResponsiveDesktopUtils
                                                              .getResponsiveSize(
                                                                  context, 20),
                                                      child:
                                                          CircularProgressIndicator(
                                                              strokeAlign: 1,
                                                              strokeWidth: 2,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  )
                                                : Text('Send Message',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            ResponsiveDesktopUtils
                                                                .getResponsiveSize(
                                                                    context,
                                                                    16),
                                                        color: MyColor.white,
                                                        fontWeight:
                                                            FontWeight.w200))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate().slideX().shimmer(duration: 1.5.seconds),
                  )
                ],
              )
            ),
            SizedBox(
              height: size.width / 8.78,
            ),
            Footer(size: size)
          ],
        ),
      ),
    );
  }
}
