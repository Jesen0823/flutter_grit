import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo5/bloc/name5_bloc.dart';

class ButtonWidget5 extends StatelessWidget {
  const ButtonWidget5(
      {Key? key, required this.focusNode, required this.editController})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController editController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      focusNode: focusNode,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 1),
        minimumSize: const Size(175, 50),
      ),
      onPressed: () {
        BlocProvider.of<Name5Bloc>(context)
            .add(GetStateEvent(name: editController.text));
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('提交'),
    );
  }
}