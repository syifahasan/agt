import 'package:authentic_guards/helper/ui_helpers.dart';
import 'package:authentic_guards/pages/scanner/scanner_views.dart';
import 'package:authentic_guards/pages/scanner/scanner_proccess_result.dart';
import 'package:authentic_guards/pages/scanner/scanner_claim_success.dart';
import 'package:authentic_guards/data/di/inject_container.dart';
import 'package:authentic_guards/pages/scanner/scanner_controller.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:authentic_guards/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:authentic_guards/component/button_component.dart';
import 'package:authentic_guards/component/loading_views.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

class ScannerResultViews extends StatefulWidget {
  final String? barcode;

  ScannerResultViews({Key? key, this.barcode}) : super(key: key);

  @override
  State<ScannerResultViews> createState() => _ScannerResultViewsState();
}

class _ScannerResultViewsState extends State<ScannerResultViews> {
  late ScannerController controller;
  bool productOwner = false;

  String? completePin;

  @override
  void initState() {
    controller = Get.put(ScannerController(scanner: inject()));
    controller.doScan(code: widget.barcode ?? "");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(body: SafeArea(child: Obx(() {
        final response = (controller.resultMap as Map<String, dynamic>);
        final claim = (controller.resultClaim as Map<String, dynamic>);

        if (controller.isLoading) {
          return AnimatedOpacity(
            opacity: controller.isLoading ? 1.0 : 0.0,
            duration: Duration(microseconds: 1000),
            child: LoadingViews(),
          );
        }

        if (response['status'] == 11 ||
            response['status'] == 1 ||
            controller.hasError) {
          return _failed();
        }

        return AnimatedOpacity(
          opacity: !controller.isLoading ? 1.0 : 0.0,
          duration: Duration(milliseconds: 2000),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: response['result']['user']['id'] == 0
                  ? _notHaveOwner(response)
                  : !productOwner
                      ? hasClaimed(response)
                      : _productOwner(response)),
        );
      }))),
    );
  }

  Widget _notHaveOwner(Map<String, dynamic> response) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, left: 16),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(MdiIcons.chevronLeft, color: Colors.black)),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          alignment: Alignment.center,
          child: Text(
            "Congratulations!",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Lottie.asset('assets/lottie/success.json')),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          alignment: Alignment.center,
          child: Image.network(
              '${response['path']['image_product']}${response['result']['product']['image']}${response['path']['image_product_ext']}'),
        ),
        if (response['message'] != 1) ...[
          Container(
            alignment: Alignment.center,
            child: _productDetails(response),
          ),
        ],
        if (response['code_claim'] != null) ...[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 38, vertical: 24),
              alignment: Alignment.center,
              child: Text(
                "Please input the pin on the scratch section then click the button below to claim the product that you purchase!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                textAlign: TextAlign.center,
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                  backgroundColor: CustomTheme.fillColorField,
                  enabledBorderColor: CustomTheme.fillColorField,
                  focusBorderColor: CustomTheme.fillColorField,
                  disabledBorderColor: CustomTheme.fillColorField),
              onCompleted: (pin) {
                setState(() {
                  completePin = pin;
                });
              },
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 38, right: 38, top: 24, bottom: 38),
              child: ButtonWidget(
                onClicked: () {
                  controller.doClaim(pin: completePin ?? "");
                },
                text: 'Submit',
                bgColor: completePin?.isNotEmpty == true
                    ? CustomTheme.primaryColor
                    : CustomTheme.primaryButtonColor,
                enable: completePin?.isNotEmpty,
              )),
        ]
      ],
    );
  }

  Widget _productDetails(Map<String, dynamic> response) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: CustomTheme.hintColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Product Details",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomTheme.fillColorField,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 38),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(3),
              },
              children: [
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('code',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${response['result']['code']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${response['result']['product']['nama']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Size',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${response['result']['product']['size']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Production Date',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${response['result']['product']['distributedOn']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Company',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${response['result']['order']['brand']['name']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${response['result']['order']['brand']['csEmail']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Website',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${response['result']['order']['brand']['web']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
                TableRow(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Company Hotline',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(':',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${response['result']['order']['brand']['csPhone']}',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400))
                      ]),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _productOwner(Map<String, dynamic> response) {
    final appBar = AppBar();

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: appBar.preferredSize.height,
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 24),
                child: InkWell(
                  child: Icon(MdiIcons.chevronLeft),
                  onTap: () {},
                )),
          ),
          SizedBox(
            height: 24,
          ),
          Text("Product Owner",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
          SizedBox(
            height: 56,
          ),
          CircleAvatar(
            backgroundImage: Image.asset('assets/other/temp_profile.png').image,
            radius: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 46, bottom: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomTheme.hintColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Product Owner",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomTheme.fillColorField,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(vertical: 26, horizontal: 38),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(3),
                    },
                    children: [
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${response['result']['user']['name']}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${response['result']['product']['nama']}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Time',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${response['result']['product']['distributedOn']}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${response['result']['time'].split('-').reversed.join('-').replaceAll('-', '/')}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Status',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${response['claim']}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700))
                            ]),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "This Product has been claimed! You can go back to homepage!",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(top: 56),
            child: ButtonWidget(
              text: "Back to homepage",
              bgColor: CustomTheme.fillColorField,
              textColor: CustomTheme.hintColor,
              withBoxShadow: false,
              onClicked: () {
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _failed() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            "Failed !",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 24,
          ),
          Lottie.asset('assets/lottie/failed.json', width: 150),
          Spacer(),
          Container(
              margin: EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "The verification process is not completed. Please retry the verification process!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        notFound(context);
                      },
                      child: Icon(MdiIcons.information))
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 46),
            width: MediaQuery.of(context).size.width * 0.8,
            child: ButtonWidget(
              text: "Retry",
              bgColor: CustomTheme.fillColorField,
              textColor: CustomTheme.hintColor,
              onClicked: () {
                Get.back();
              },
            ),
          ),
          SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget hasClaimed(Map<String, dynamic> response) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, left: 16),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(MdiIcons.chevronLeft, color: Colors.black)),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          alignment: Alignment.center,
          child: Text(
            "Congratulations!",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Lottie.asset('assets/lottie/success.json', width: 300)),
        Container(
            alignment: Alignment.center,
            child: Text(
              "The product you bought is",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: CustomTheme.greyTextColor),
            )),
        Container(
            alignment: Alignment.center,
            child: Text("genuine/authentic.",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: CustomTheme.greyTextColor))),
        SizedBox(height: 100),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          alignment: Alignment.center,
          child: Image.network(
              '${response['path']['image_product']}${response['result']['product']['image']}${response['path']['image_product_ext']}'),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 24),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomTheme.hintColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Product Details",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: CustomTheme.fillColorField,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 38),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('code',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${response['result']['code']['code']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${response['result']['product']['nama']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Size',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${response['result']['product']['size']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Production Date',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${response['result']['product']['distributedOn']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Company',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${response['result']['product']['brand']['name']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${response['result']['product']['brand']['csEmail']}',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.visible,
                            )
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Website',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${response['result']['product']['brand']['web']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Company Hotline',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${response['result']['product']['brand']['csPhone']}',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 39, vertical: 28),
            alignment: Alignment.center,
            child: Text(
              "This product has been claimed! You can check the product owner by clicking “Product Owner” down below!",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: CustomTheme.greyTextColor),
              textAlign: TextAlign.center,
            )),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 38, right: 38, top: 24, bottom: 38),
            child: ButtonWidget(
              onClicked: () {
                setState(() {
                  productOwner = true;
                });
              },
              text: 'Product Owner',
              textColor: CustomTheme.greyTextColor,
            )),
      ],
    );
  }
}

void notFound(BuildContext context) {
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
                    "Oops!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff373743),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.2),
                  ),
                ),
                Image.asset('assets/other/notfound.png', width: 100),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                      "There seems to be an error that leads to failure for the verification step. Please check the QR code or the unique pin that you inserted!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        child: Text(
                          "Kembali",
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
