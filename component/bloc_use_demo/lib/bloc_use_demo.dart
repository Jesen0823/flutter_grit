library bloc_use_demo;
import 'package:bloc_use_demo/bloc/show_data_bloc.dart';
import 'package:bloc_use_demo/repo/show_repo.dart';
import 'package:bloc_use_demo/ui/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildComponentBlocDemo() => BlocProvider<ShowDataBloc>(
  create: (context) => ShowDataBloc(ShowRepo()),
  child: ShowApp(),
);


class ShowApp extends StatelessWidget {
  const ShowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc demo apply, [bloc_use_demo]',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.amberAccent
      ),
      home: const LoadingPage(),
    );
  }
}

