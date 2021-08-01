import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  const DateTimeDemo({Key? key}) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  final DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(DateFormat.yMMMMd().format(selectDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
