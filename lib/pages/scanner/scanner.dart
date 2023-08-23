import 'dart:ui';

import 'package:authentic_guards/pages/scanner/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    super.key,
    required this.isScannerActive,
  });
  final bool isScannerActive;

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool isScanned = false;
  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    // returnImage: true,
  );

  void closeScreen() {
    isScanned = false;
    stopScanner();
  }

  void startScanner() {
    controller.start();
    print('CAMERA STARTED');
  }

  void stopScanner() {
    controller.stop();
    print('CAMERA STOPPED');
  }

  @override
  void initState() {
    super.initState();
    if (widget.isScannerActive) {
      startScanner();
      print('initState called');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    stopScanner();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return WillPopScope(
      onWillPop: () async {
        stopScanner();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            MobileScanner(
              controller: controller,
              onDetect: (capture) {
                if (!isScanned) {
                  final List<Barcode> barcodes = capture.barcodes;
                  final List<String> values = [];
                  // final Uint8List? image = capture.image;

                  for (final barcode in barcodes) {
                    values.add(barcode.rawValue ?? '----');
                    debugPrint('Barcode found! ${barcode.rawValue}');
                  }
                  String code = values.join('');
                  isScanned = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScanResult(code: code, closeScreen: closeScreen)),
                  );
                  // if (image != null) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) => Image(image: MemoryImage(image)),
                  //   );
                  //   Future.delayed(
                  //     const Duration(seconds: 5),
                  //     () {
                  //       Navigator.pop(context);
                  //     },
                  //   );
                  // }
                }
              },
            ),
            Positioned(
              top: 50,
              right: 20,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: screenWidth * 40 / 100,
                  height: screenWidth * 25 / 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent),
                  // padding: EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                        child: Container(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.13),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.4),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Scan Verification",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    "Please scan the barcode on your product to proceed the verification process!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SFProDisplay',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 55),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: screenWidth * 10 / 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent),
                    // padding: EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                          child: Container(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.13),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0.4),
                                ],
                              )),
                        ),
                        Center(
                          child: RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Point the camera to barcode!",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFProDisplay',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose method called');
    if (widget.isScannerActive) {
      stopScanner();
    }
    controller.dispose();
  }
}
