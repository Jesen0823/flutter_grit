import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo3/cubit/name_cubit3.dart';
import 'package:flutter_grit/demo/Bloc/demo3/ui/demo3_home_page.dart';

class RouteGenerator3 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NameCubit3>(
            create: (context) => NameCubit3(),
            child: const Demo3HomePage(title: "name 多个状态管理"),
          ),
        );

      default:
        return _errorRoute3();
    }
  }

  static Route<dynamic> _errorRoute3() {
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