import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo3/cubit/name_cubit3.dart';

class ButtonWidget3 extends StatelessWidget {
  const ButtonWidget3(
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
        BlocProvider.of<NameCubit3>(context)
            .displayData(editController.text);
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('提交'),
    );
  }
}