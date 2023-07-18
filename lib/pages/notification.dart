import 'package:flutter/material.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
    );
  }
}