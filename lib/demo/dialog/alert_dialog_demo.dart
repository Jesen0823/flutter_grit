import 'package:flutter/material.dart';

enum Action{OK, CANCEL}

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

   Future _openAlertDialog() async {
     final action = await showDialog(
        context: context,
        // 空白处是否点击可退出
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Could you close it?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context,Action.CANCEL),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context,Action.OK),
                child: Text('OK'),
              ),
            ],
          );
        }
    );
     switch(action){
       case Action.OK:
         setState(() {
           _choice = '已确认';
         });
         break;
       case Action.CANCEL:
         _choice = '已取消';
         break;
       default:
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('result is :$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _openAlertDialog,
                    child: Text('openAlertDialog'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
