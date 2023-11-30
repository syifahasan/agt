import 'dart:typed_data';
import 'package:authentic_guards/auth/login.dart';
import 'package:authentic_guards/helper/ui_helpers.dart';
import 'package:authentic_guards/pages/profile/profile.dart';
import 'package:camera/camera.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:authentic_guards/data/di/inject_container.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:authentic_guards/pages/scanner/painter/barcode_detector_painter.dart';
import 'package:authentic_guards/pages/scanner/scanner_controller.dart';
import 'package:authentic_guards/pages/scanner/scanner_result_views.dart';
import 'package:authentic_guards/pages/scanner/widget/camera_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

import '../../main.dart';

import 'widget/self_camera_controller.dart';

class ScannerViews extends StatefulWidget {
  const ScannerViews({Key? key}) : super(key: key);

  @override
  State<ScannerViews> createState() => _ScannerViewsState();
}

class _ScannerViewsState extends State<ScannerViews> {
  late ScannerController controller;

  late SelfCameraController selfCameraController;
  CameraController? cameraController;
  CameraLensDirection initialDirection = CameraLensDirection.back;

  late MobileScannerController mobileScannerController;

  List<CameraDescription> cameras = [];

  @override
  void initState() {
    controller = Get.put(ScannerController(scanner: inject()));

    controller.loginCheck();

    initCamera();

    mobileScannerController =
        MobileScannerController(facing: CameraFacing.back, torchEnabled: false);
  }

  String _text = "";

  @override
  void dispose() {
    super.dispose();
  }

  void initCamera() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final isLogin = controller.isLogin as bool? ?? false;

            return MobileScanner(
                allowDuplicates: true,
                controller: mobileScannerController,
                onDetect: (barcode, MobileScannerArguments? args) {
                  if (_text != barcode.rawValue) {
                    setState(() {
                      _text = barcode.rawValue!;
                    });

                    EasyDebounce.debounce(
                      'scanner',
                      const Duration(seconds: 2),
                      () async {
                        if (!isLogin) {
                          signIn(context);
                          setState(() => {_text = ""});
                          return;
                        }

                        Vibration.hasVibrator().then((value) {
                          if (value == true) {
                            Vibration.vibrate();
                          }
                        });

                        var result = barcode.rawValue;

                        if (result?.contains('/') == true &&
                            result?.contains('agcode.id') != true) return;
                        if (result?.contains('/') == true &&
                            result?.contains('agcode.id') == true) {
                          result = result?.split("/").last ?? "";
                        }

                        Get.to(ScannerResultViews(
                          barcode: result,
                        ))?.then((value) => {
                              setState(() => {_text = ""})
                            });
                      },
                    );
                  }
                });
          }),
          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Scan Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                    Text(
                      "Please scan the barcode on your product to proceed the verification process!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
          Positioned(
            bottom: 100,
            right: 40,
            left: 40,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Point the camera to the barcode!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void signIn(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            contentPadding: EdgeInsets.fromLTRB(0, 24, 0, 0),
            content: Container(
              width: UiHelpers.getWidthPageSize(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Please Sign In!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff373743),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2),
                    ),
                  ),
                  Image.asset('assets/other/signin.png', width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Get.to(PageLogin())?.then((value) => {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5))),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
