import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class SelfCameraController extends GetxController {
  List<CameraDescription> cameras = [];
  Future<void> getCameras() async {
    try {
      cameras = await availableCameras();
    } catch(e) {
      print('Terjadi kesalahan pada kamera');
    }
  }
}

