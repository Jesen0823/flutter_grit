import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/Bloc/demo3/route/routes_generator3.dart';

void main(){
  runApp(const NameDemo3());
}

class NameDemo3 extends StatelessWidget {
  const NameDemo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter v8.0 of Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator3.generateRoute,
    );
  }
}
