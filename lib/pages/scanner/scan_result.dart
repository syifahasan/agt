import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({super.key, required this.code, required this.closeScreen});
  final String code;
  final Function() closeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          closeScreen();
          Navigator.pop(context);
        },),
      ),
      body: Column(children: [
        QrImageView(
          data: code,
          size: 150,
          version: QrVersions.auto,
        ),
        Text('$code'),
      ],),
    );
  }
}
