import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  InputForm({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: Colors.grey,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
            hintStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
            contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
