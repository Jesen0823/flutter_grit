import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black12,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );

  final Widget _floatingActionButtonNoShape = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black12,
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    label: Text('Add'),
    icon: Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _floatingActionButtonExtended,
          SizedBox(
            height: 32.0,
          ),
          _floatingActionButton,
          SizedBox(
            height: 32.0,
          ),
          _floatingActionButtonNoShape,
        ],
      ),
      floatingActionButton: _floatingActionButtonNoShape,
      // 位置设置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
          color: Colors.grey[500],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}