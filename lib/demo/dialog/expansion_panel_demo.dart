import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems = <ExpansionPanelItem>[
    ExpansionPanelItem(
      headerText: 'Pannel A',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content of Item A'),
      ),
      isExpanded: false,
    ),
    ExpansionPanelItem(
      headerText: 'Pannel B',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content of Item B'),
      ),
      isExpanded: false,
    ),
    ExpansionPanelItem(
      headerText: 'Pannel C',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content of Item C'),
      ),
      isExpanded: false,
    ),
  ];

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
                  _expansionPanelItems[expanelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  body: item.body,
                  isExpanded: item.isExpanded,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        item.headerText,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    required this.isExpanded,
  });
}
