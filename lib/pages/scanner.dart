import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
    );
  }
}