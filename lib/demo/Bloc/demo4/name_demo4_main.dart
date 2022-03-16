import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/Bloc/demo4/route/routes_generator4.dart';

void main(){
  runApp(const NameDemo4());
}

class NameDemo4 extends StatelessWidget {
  const NameDemo4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter v8.0 of Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator4.generateRoute,
    );
  }
}
