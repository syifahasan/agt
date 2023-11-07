import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:authentic_guards/helper/ui_helpers.dart';

class SelfCameraController extends GetxController {
  List<CameraDescription> cameras = [];
  Future<void> getCameras() async {
    try {
      cameras = await availableCameras();
    } catch(e) {
      UiHelpers.showSnackBar(Get.context!, snackBarMode: SnackBarMode.ERROR, content: "Terjadi kesalahan pada kamera");
    }
  }

}