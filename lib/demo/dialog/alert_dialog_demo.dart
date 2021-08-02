import 'package:flutter/material.dart';

enum Action{OK, CANCEL}

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

  _openAlertDialog(){
    showDialog(
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
