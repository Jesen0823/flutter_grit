import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '头文字： ',
        style: const TextStyle(fontSize: 25.00,color: Colors.green),
        children: <TextSpan>[
          TextSpan(
            text: message,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.00,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }
}