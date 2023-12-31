import 'package:flutter/widgets.dart';

class SizeConfig {


  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
  }

  double getProportionateScreenHeight(double inputHeight) {
    double? screeHeight = SizeConfig.screenHeight;
    return (inputHeight / 812.0) * screeHeight!;
  }

  double getProportionateScreenWidth(double inputWidth) {
    double? screeWidth = SizeConfig.screenWidth;
    return (inputWidth / 375.0) * screeWidth!;
  }
}
