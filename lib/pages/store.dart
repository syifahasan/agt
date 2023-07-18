import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
    );
  }
}