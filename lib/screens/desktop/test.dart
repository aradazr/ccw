import 'package:ccw/constans/my_color.dart';
import 'package:ccw/widgets/core_values.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Wrap(
          runSpacing: size.width / 30,
          spacing: size.width / 30,
          children: [
            
            
          ],
        ),
      ),
    );
  }
}


