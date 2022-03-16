import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo4/cubit/name_cubit4.dart';
import 'package:flutter_grit/demo/Bloc/demo4/ui/demo4_home_page.dart';

class RouteGenerator4 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NameCubit4>(
            create: (context) => NameCubit4(),
            child: const Demo4HomePage(title: "name 多个状态管理"),
          ),
        );

      default:
        return _errorRoute4();
    }
  }

  static Route<dynamic> _errorRoute4() {
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