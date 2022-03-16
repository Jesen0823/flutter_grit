import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/Bloc/demo5/route/routes_generator5.dart';

void main(){
  runApp(const NameDemo5());
}

class NameDemo5 extends StatelessWidget {
  const NameDemo5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter v8.0 of Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator5.generateRoute,
    );
  }
}
