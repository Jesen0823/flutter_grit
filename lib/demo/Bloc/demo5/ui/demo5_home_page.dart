import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo5/bloc/name5_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo5/ui/my_button5.dart';
import 'package:flutter_grit/demo/Bloc/demo5/ui/title_view5.dart';

import 'input_edit5.dart';

class Demo5HomePage extends StatefulWidget {
  const Demo5HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo5HomePage> createState() => _Demo5HomePageState();
}

class _Demo5HomePageState extends State<Demo5HomePage> {
  late FocusNode nameBtnFocusNode;
  late TextEditingController editController;

  @override
  void initState() {
    super.initState();
    nameBtnFocusNode = FocusNode();
    editController = TextEditingController();
  }

  @override
  void dispose() {
    nameBtnFocusNode.dispose();
    editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: BlocConsumer<Name5Bloc, Demo5State>(
          listener: (context, state) {
            if (state is Name5StateError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is Name5StateLoading) {
              return buildLoading();
            } else if (state is Name5StateLoaded) {
              return buildLoadedInput(state.stateOfName);
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleView5(message: "☻"),
          const SizedBox(height: 20),
          InputEditField5(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          ButtonWidget5(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
        ],
      );

  Widget buildLoading() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20.0),
            Text("Loading..."),
          ]);

  Widget buildLoadedInput(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleView5(message: data),
          const SizedBox(height: 20),
          InputEditField5(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          ButtonWidget5(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
        ],
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请输入姓名!'),
        ),
      );
}
