import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo2/cubit/name_cubit2.dart';
import 'package:flutter_grit/demo/Bloc/demo2/ui/demo2_home_page.dart';

class RouteGenerator2 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NameCubit2>(
            create: (context) => NameCubit2(),
            child: const Demo2HomePage(title: "name 计算"),
          ),
        );

      default:
        return _errorRoute2();
    }
  }

  static Route<dynamic> _errorRoute2() {
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