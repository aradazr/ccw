import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class SendMessagePage extends StatefulWidget {
  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isSending = false;

  final Dio dio = Dio();

  // تابع بررسی ایمیل معتبر
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    return emailRegex.hasMatch(email);
  }

Future<void> sendMessage() async {
  final String email = emailController.text.trim();
  final String message = messageController.text.trim();
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  if (email.isEmpty || message.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('لطفاً ایمیل و پیام را وارد کنید.')),
    );
    return;
  }

  if (!isValidEmail(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('لطفاً یک ایمیل معتبر وارد کنید.')),
    );
    return;
  }

  setState(() => isSending = true);

  try {
    // بررسی اینکه آیا امروز با این ایمیل قبلاً پیام ارسال شده
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

    // در غیر اینصورت پیام ارسال شود
    final response = await dio.post(
      'https://pocketbase-5i4fn3.chbk.app/api/collections/messages/records',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
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
      body: Padding(
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