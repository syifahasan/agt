import 'package:authentic_guards/helper/helper.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:authentic_guards/theme/text.dart';
import 'package:authentic_guards/utils/constant.dart';
import 'package:flutter/material.dart';

enum ButtonType { NORMAL, TRANSPARENT, DASHED, ICON_ONLY }

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final ButtonType? type;
  final bool? enable;
  final String? iconAsset;
  final bool? isLoading;

  final BoxShadow? boxShadow;
  final bool? withBoxShadow;

  final Color? color;
  final Color? bgColor;
  final Color? textColor;

  final CustomTextStyle style = CustomTextStyle();

  ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.type = ButtonType.NORMAL,
    this.color,
    this.enable = true,
    this.bgColor,
    this.textColor,
    this.iconAsset,
    this.boxShadow,
    this.withBoxShadow,
    this.isLoading,
  }) : super(key: key);

  ButtonWidget.transparent({
    Key? key,
    required this.text,
    required this.onClicked,
    this.type = ButtonType.TRANSPARENT,
    this.color,
    this.enable,
    this.bgColor,
    this.textColor,
    this.iconAsset,
    this.boxShadow,
    this.withBoxShadow,
    this.isLoading,
  }) : super(key: key);

  ButtonWidget.dashed({
    Key? key,
    required this.text,
    required this.onClicked,
    this.type = ButtonType.DASHED,
    this.color,
    this.enable = true,
    this.bgColor,
    this.textColor,
    this.iconAsset,
    this.boxShadow,
    this.withBoxShadow,
    this.isLoading,
  }) : super(key: key);

  ButtonWidget.icon({
    Key? key,
    required this.text,
    required this.onClicked,
    this.type = ButtonType.ICON_ONLY,
    this.color,
    this.enable = true,
    this.bgColor,
    this.textColor,
    this.iconAsset,
    this.boxShadow,
    this.withBoxShadow,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.TRANSPARENT) {
      return Container(
        width: double.infinity,
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
            border: Border.all(color: CustomTheme.primaryColor),
            borderRadius: BorderRadius.circular(50)),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: Colors.white,
              backgroundColor: Colors.transparent,
              textStyle: style.buttonText),
          onPressed: enable == false ? () {} : onClicked,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(14),
              color: textColor ?? Colors.black,
            ),
          ),
        ),
      );
    }

    if (type == ButtonType.ICON_ONLY) {
      return InkWell(
        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: bgColor ?? CustomTheme.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: getIconFromAsset(iconAsset ?? ""),
        ),
      );
    }

    if (withBoxShadow == false) {
      return Container(
        width: double.infinity,
        height: getProportionateScreenHeight(40),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: Colors.white,
              backgroundColor: enable == false
                  ? CustomTheme.greyColor
                  : bgColor ?? CustomTheme.primaryColor,
              textStyle: style.buttonText),
          onPressed: enable == false ? () {} : onClicked,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(14),
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      );
    }

    if (isLoading == true) {
      return Container(
        width: double.infinity,
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
            //     boxShadow: [
            //   boxShadow ?? BoxShadow(
            //     color: CustomTheme.greyColor.withOpacity(0.4),
            //     spreadRadius: 1,
            //     blurRadius: 3,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ]
            ),
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: Colors.white,
                backgroundColor: enable == false
                    ? CustomTheme.greyColor
                    : bgColor ?? CustomTheme.primaryButtonColor,
                textStyle: style.buttonText),
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            )),
      );
    }

    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(40),
      decoration: BoxDecoration(
          //     boxShadow: [
          //   boxShadow ?? BoxShadow(
          //     color: CustomTheme.greyColor.withOpacity(0.4),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ]
          ),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            primary: Colors.white,
            backgroundColor: enable == false
                ? CustomTheme.greyColor
                : bgColor ?? CustomTheme.primaryButtonColor,
            textStyle: style.buttonText),
        onPressed: enable == false ? () {} : onClicked,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: getProportionateScreenWidth(14),
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
