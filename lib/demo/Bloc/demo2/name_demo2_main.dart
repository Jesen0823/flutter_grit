import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/Bloc/demo2/route/routes_generator2.dart';

void main(){
  runApp(const NameDemo2());
}

class NameDemo2 extends StatelessWidget {
  const NameDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter v8.0 of Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator2.generateRoute,
    );
  }
}
