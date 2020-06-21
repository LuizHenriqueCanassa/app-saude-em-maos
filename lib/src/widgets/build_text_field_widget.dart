import 'package:flutter/material.dart';

class BuildTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function function;
  final bool readyOnly;

  BuildTextFieldWidget(this.label, this.controller, this.inputType, {this.function, this.readyOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: inputType,
      onTap: function,
      readOnly: readyOnly != null ? readyOnly : false,
    );
  }
}
