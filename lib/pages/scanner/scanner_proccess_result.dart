import 'package:authentic_guards/component/button_component.dart';
import 'package:authentic_guards/pages/scanner/scanner_views.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

enum ScannerResultBack { SCANNER , PRODUCT }

class ScannerProccessResult extends StatefulWidget {
  final ScannerResultBack state;
  const ScannerProccessResult({Key? key, required this.state}) : super(key: key);

  @override
  State<ScannerProccessResult> createState() => _ScannerProccessResultState();
}

class _ScannerProccessResultState extends State<ScannerProccessResult> {
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
              Text("Failed !",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 24,),
              Lottie.asset('assets/lottie/failed.json',width: 150),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text("The verification process is not completed. Please retry the verification process!",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,

                ),textAlign: TextAlign.center,),
              ),
              Container(
                margin: EdgeInsets.only(top: 46),
                width: MediaQuery.of(context).size.width * 0.8,
                child: ButtonWidget(
                  text: "Retry", bgColor: CustomTheme.fillColorField,textColor: CustomTheme.hintColor,onClicked: () {
                    Get.back();
                },
                ),
              ),
              SizedBox(height: 18,),
              InkWell(
                onTap: () {
                  Get.off(ScannerViews());
                },
                child: Text("Back to homepage",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                ),),
              ),
              SizedBox(height: 100 ,)
            ],
          ),
        ),
      ),
    );
  }
}
