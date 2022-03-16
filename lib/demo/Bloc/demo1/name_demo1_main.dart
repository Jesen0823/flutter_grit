import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/Bloc/demo1/route/routes_generator.dart';

void main(){
  runApp(const NameDemo1());
}

class NameDemo1 extends StatelessWidget {
  const NameDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter v8.0 of Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
