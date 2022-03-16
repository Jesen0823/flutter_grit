import 'package:flutter/material.dart';

class TitleView5 extends StatelessWidget {
  const TitleView5({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '头文字： ',
        style: const TextStyle(fontSize: 25.00,color: Colors.deepOrangeAccent),
        children: <TextSpan>[
          TextSpan(
            text: message,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55.00,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }
}