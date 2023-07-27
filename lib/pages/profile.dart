import 'package:authentic_guards/auth/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 233, 144, 144)],
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
        title: Center(
          child: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withAlpha(70),
            ),
          );
        },
      ),
    );
  }
}
