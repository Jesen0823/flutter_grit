import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputEditField4 extends StatelessWidget {
  const InputEditField4(
      {Key? key, required this.focusNode, required this.editController})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController editController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("姓名 :"),
        const SizedBox(width: 45),
        SizedBox(
          width: 160,
          child: TextFormField(
            controller: editController,
            autofocus: true,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNode);
            },
            keyboardType: TextInputType.text,
            /*inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],*/
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              hintStyle: const TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.blue[50],
            ),
          ),
        ),
      ],
    );
  }
}
