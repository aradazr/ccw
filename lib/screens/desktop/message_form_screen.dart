import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class SendMessagePage extends StatefulWidget {
  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
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

class _SendMessagePageState extends State<SendMessagePage> {
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
      return 'ایمیل باید حداقل ۶ کاراکتر داشته باشد.';
    }

    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return 'لطفاً یک ایمیل معتبر وارد کنید.';
    }

    final localPart = email.split('@').first;
    if (localPart.length < 6) {
      return 'بخش اول ایمیل (قبل از @) باید حداقل ۴ کاراکتر داشته باشد.';
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(emailError)));
      return;
    }

    if (message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لطفاً پیام را وارد کنید.')),
      );
      return;
    }

    if (captchaInput != (num1 + num2).toString()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد امنیتی اشتباه است.')),
      );
      return;
    }
    if (isDisposableEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لطفاً از یک ایمیل واقعی استفاده کنید.')),
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
            content: Text('شما امروز قبلاً پیام ارسال کرده‌اید.'),
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
          SnackBar(content: Text('پیام با موفقیت ارسال شد!')),
        );
      }
    } on DioException catch (e) {
      setState(() => isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در ارسال پیام. دوباره تلاش کنید.'),
          backgroundColor: Colors.red,
        ),
      );
      print('Dio error: ${e.response?.data}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ارسال پیام')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'ایمیل شما'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'متن پیام'),
              maxLines: 5,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text('کد امنیتی: $num1 + $num2 = '),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: captchaController,
                    decoration: InputDecoration(hintText: 'پاسخ را وارد کنید'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  onPressed: _generateCaptcha,
                  icon: Icon(Icons.refresh),
                  tooltip: 'تغییر کد',
                ),
              ],
            ),
            SizedBox(height: 20),
            isSending
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: sendMessage,
                    child: Text('ارسال پیام'),
                  ),
          ],
        ),
      ),
    );
  }
}
