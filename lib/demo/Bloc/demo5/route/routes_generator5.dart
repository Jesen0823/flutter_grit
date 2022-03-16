import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo5/bloc/name5_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo5/ui/demo5_home_page.dart';

class RouteGenerator5 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<Name5Bloc>(
            create: (context) => Name5Bloc(),
            child: const Demo5HomePage(title: "name 多个状态管理"),
          ),
        );

      default:
        return _errorRoute5();
    }
  }

  static Route<dynamic> _errorRoute5() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}