import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: SizeConfig().getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
      vertical: SizeConfig().getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius:
        BorderRadius.circular(SizeConfig().getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: CustomTheme.primaryColor),
  );
}

double getProportionateScreenHeight(double inputHeight) {
  double? screeHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screeHeight!;
}

double getProportionateScreenWidth(double inputWidth) {
  double? screeWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screeWidth!;
}

double safeAreaTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

Color getRandomColor() {
  final List<Color> listColor = [
    Color(0xFFF5EE83),
    Color(0xFFF9EEC3),
    Color(0xFFDBDBE4),
    Color(0xFFD7EDF3)
  ];
  final _random = new Random();
  return listColor[_random.nextInt(listColor.length)];
}

const WHATSAPP_URL =
    "https://api.whatsapp.com/send?phone=6285943794777&text=Salam%20Admin%2C%20kami%20tertarik%20dengan%20layanan%20yang%20ada%20di%20STNK%20GO%20%0AMohon%20info%20detail%20tentang%20layanannya";
String getWhatsappUrl() {
  if (Platform.isAndroid) {
    return "https://wa.me/6285943794777/?text=Salam%20Admin%2C%20kami%20tertarik%20dengan%20layanan%20yang%20ada%20di%20STNK%20GO%20%0AMohon%20info%20detail%20tentang%20layanannya}"; // new line
  } else {
    return "https://api.whatsapp.com/send?phone=6285943794777&text=Salam%20Admin%2C%20kami%20tertarik%20dengan%20layanan%20yang%20ada%20di%20STNK%20GO%20%0AMohon%20info%20detail%20tentang%20layanannya";
  }
}

//midtrans configuration
const merchantId = "G287525260";
const clientKey = "Mid-client-VbwDkKlNcmj5fKo8";
const serverKey = "Mid-server-oANvDKLk06jfOBWr3j9Sj-ej";

const textSettingStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 15);
