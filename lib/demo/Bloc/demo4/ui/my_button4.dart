import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo4/cubit/name_cubit4.dart';

class ButtonWidget4 extends StatelessWidget {
  const ButtonWidget4(
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
        BlocProvider.of<NameCubit4>(context)
            .updateName(editController.text);
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('提交'),
    );
  }
}