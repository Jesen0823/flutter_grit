import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutDemo extends StatefulWidget {
  const CheckoutDemo({Key? key}) : super(key: key);

  @override
  _CheckoutDemoState createState() => _CheckoutDemoState();
}

class _CheckoutDemoState extends State<CheckoutDemo> {
  bool _checkItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckoutDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
                value: _checkItemA,
                onChanged: (value){
                  setState(() {
                    _checkItemA = value!;
                  });
                },
              title: Text('CheckBox ItemA'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.bookmark),
              selected: _checkItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Checkbox(
                    value: _checkItemA,
                    onChanged: (value){
                      setState(() {
                        _checkItemA = value!;
                      });
                    },
                  activeColor: Colors.black,
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
