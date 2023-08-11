import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../utils/camera/self_camera_controller.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    super.key,
  });
  // final List<CameraDescription> cameras;

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
