import 'package:flutter/material.dart';

class MyPayment extends StatelessWidget {
  const MyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
                center: Alignment.topCenter,
                radius: 10,
              )),
        ),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(
          'Privacy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
