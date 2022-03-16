import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo2/cubit/name_cubit2.dart';
import 'package:flutter_grit/demo/Bloc/demo2/ui/my_button.dart';
import 'package:flutter_grit/demo/Bloc/demo2/ui/title_view.dart';

import 'input_edit.dart';

class Demo2HomePage extends StatefulWidget {
  const Demo2HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo2HomePage> createState() => _Demo2HomePageState();
}

class _Demo2HomePageState extends State<Demo2HomePage> {

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<NameCubit2,NameInitial2>(
              builder: (context, state) {
                return TitleView(message: state.stateOfName);
              }
            ),
            const SizedBox(height: 20,),
            InputEditField(
              editController: editController,
              focusNode: nameBtnFocusNode,

            ),
            const SizedBox(height: 10,),
            ButtonWidget(
                focusNode: nameBtnFocusNode,
                editController: editController,
            ),
          ],
        ),
      ),
    );
  }
}
