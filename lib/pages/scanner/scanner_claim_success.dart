import 'package:authentic_guards/component/button_component.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScannerClaimSucess extends StatelessWidget {
  const ScannerClaimSucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                "Successful claim !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 24,
              ),
              Lottie.asset('assets/lottie/success.json', width: 150),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "The verification process is completed.you have purchased this product",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.only(top: 46),
                width: MediaQuery.of(context).size.width * 0.8,
                child: ButtonWidget(
                  text: "Back to homepage",
                  bgColor: CustomTheme.fillColorField,
                  textColor: CustomTheme.hintColor,
                  onClicked: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
