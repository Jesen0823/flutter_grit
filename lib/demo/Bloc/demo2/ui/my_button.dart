import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo2/cubit/name_cubit2.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
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
        BlocProvider.of<NameCubit2>(context)
            .getStart(editController.text);
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('Calculate'),
    );
  }
}