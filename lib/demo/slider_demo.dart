import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _SliderItemA = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
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
                Slider(
                  value: _SliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _SliderItemA = value;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).primaryColor,
                  min: 0.0,
                  max: 10.0,
                  // 分成5等份
                  divisions: 5,
                  label: '${_SliderItemA.toInt()}',
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('SliderValue:$_SliderItemA'),
          ],
        ),
      ),
    );
  }
}
