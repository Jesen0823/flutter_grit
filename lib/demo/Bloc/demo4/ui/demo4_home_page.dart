import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo4/cubit/name_cubit4.dart';
import 'package:flutter_grit/demo/Bloc/demo4/ui/my_button4.dart';
import 'package:flutter_grit/demo/Bloc/demo4/ui/title_view4.dart';

import 'input_edit4.dart';

class Demo4HomePage extends StatefulWidget {
  const Demo4HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo4HomePage> createState() => _Demo4HomePageState();
}

class _Demo4HomePageState extends State<Demo4HomePage> {
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
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<NameCubit4, Demo4State>(
          listener: (context, state) {
            if (state is Name4StateError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is Name4StateLoading) {
              return buildLoading();
            } else if (state is Name4StateLoaded) {
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
          const TitleView4(message: "☺"),
          const SizedBox(height: 20),
          InputEditField4(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          ButtonWidget4(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
        ],
      );

  Widget buildLoading() =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        SizedBox(width: 25.0),
        Text("Loading..."),
      ]);

  Widget buildLoadedInput(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleView4(message: data),
          const SizedBox(height: 20),
          InputEditField4(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          ButtonWidget4(
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
