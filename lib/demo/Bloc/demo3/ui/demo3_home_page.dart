import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo3/cubit/name_cubit3.dart';
import 'package:flutter_grit/demo/Bloc/demo3/ui/my_button3.dart';
import 'package:flutter_grit/demo/Bloc/demo3/ui/title_view3.dart';

import 'input_edit3.dart';

class Demo3HomePage extends StatefulWidget {
  const Demo3HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo3HomePage> createState() => _Demo3HomePageState();
}

class _Demo3HomePageState extends State<Demo3HomePage> {
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
        child: BlocBuilder<NameCubit3, Demo3State>(
          builder: (context, state) {
            if (state is Demo3StateInitial) {
              return buildInitialInput();
            } else if (state is Demo3StateLoading) {
              return buildLoading();
            } else if (state is Demo3StateLoaded) {
              return buildLoadedLayout(state.msg);
            } else {
              return buildErrorLayout();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleView3(message: "❦"),
          const SizedBox(height: 20),
          InputEditField3(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          buildBtn(
              icon: Icons.upload,
              click: () => submitData(editController.text)),
        ],
      );

  Widget buildLoading() =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        SizedBox(height: 25.0),
        Text("Loading..."),
      ]);

  Widget buildLoadedLayout(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleView3(message: data),
          const SizedBox(height: 20),
          InputEditField3(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
          const SizedBox(height: 10),
          ButtonWidget3(
            focusNode: nameBtnFocusNode,
            editController: editController,
          ),
        ],
      );

  Widget buildErrorLayout() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('发生错误了！'),
          const SizedBox(
            height: 15.0,
          ),
          buildBtn(icon: Icons.arrow_back, click: () => navBack()),
        ],
      );

  void submitData(String data) {
    BlocProvider.of<NameCubit3>(context).displayData(data);
  }

  void navBack() {
    BlocProvider.of<NameCubit3>(context).restartState();
  }

  buildBtn({required IconData icon, required void Function() click}) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () => click(),
          icon: Icon(icon),
        ),
      );
}
