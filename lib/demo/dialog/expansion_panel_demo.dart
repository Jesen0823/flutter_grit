import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (int expanelIndex, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpaned) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'ExPansion Item A',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Text('Content of Item A'),
                  ),
                  isExpanded: _isExpanded,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
