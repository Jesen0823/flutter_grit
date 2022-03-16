import 'package:flutter/material.dart';

class TitleView3 extends StatelessWidget {
  const TitleView3({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '姓名： ',
        style: const TextStyle(fontSize: 25.00),
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