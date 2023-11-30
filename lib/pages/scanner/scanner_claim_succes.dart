import 'package:authentic_guards/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScannerClaimSucces extends StatelessWidget {
  const ScannerClaimSucces({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text(
              "Success !",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24),
            Container(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/success.json', width: 150),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    width: w * 0.8,
                    child: Text(
                      "The verification process is completed.you have purchased this product",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                      onPrimary: Colors.white,
                      minimumSize: Size(250.0, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: Text(
                      'Back to home page ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
