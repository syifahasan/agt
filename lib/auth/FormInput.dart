import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  InputForm({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.obscureText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 0.15),
      padding: EdgeInsets.only(top: w * 0.035),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            cursorColor: Colors.grey,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            style: TextStyle(fontSize: w * 0.04),
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
              hintStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
              contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(w * 0.1),
                borderSide:
                    BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50),
                borderSide:
                    BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
