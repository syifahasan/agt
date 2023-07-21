import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  InputForm({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: Colors.grey,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
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
