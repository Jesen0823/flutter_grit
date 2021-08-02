import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
 final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

 _openBottomSheet(){
   _bottomSheetScaffoldKey.currentState!
       .showBottomSheet(
           (context) => BottomAppBar(
             child: Container(
               height: 90.0,
               width: double.infinity,
               padding: EdgeInsets.all(16.0),
               child: Row(
                 children: [
                   Icon(Icons.pageview),
                   SizedBox(width: 16.0,),
                   Text('01:31/09i'),
                   Expanded(
                       child: Text('group down can',textAlign: TextAlign.right,),
                   ),
                 ],
               ),
             ),
           ),
   );
 }

 _openModalBottomSheet(){
   showModalBottomSheet(
       context: context,
       builder: (BuildContext context){
         return Container(
           height: 300.0,
           child: Column(
             children: [
               ListTile(
                 title: Text('去西藏贡嘎'),
               ),
               ListTile(
                 title: Text('去四川雅安'),
               ),
               ListTile(
                 title: Text('去云南普洱'),
               ),
               ListTile(
                 title: Text('去西部敦煌'),
               ),
             ],
           ),
         );
       }
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
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
                    onPressed: _openBottomSheet,
                    child: Text('Open BottomSheet'),
                ),
                ElevatedButton(
                  onPressed: _openModalBottomSheet,
                  child: Text('Open Modal BottomSheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
