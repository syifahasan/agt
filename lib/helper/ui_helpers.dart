import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:authentic_guards/theme/custom_theme.dart';
import 'package:path/path.dart';

class UiHelpers {

  static getWidthPageSize(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static getHeightPageSize(BuildContext context) =>
      MediaQuery.of(context).size.height;


  static showCustomDialog(
      BuildContext context,
      String title,
      String description, {
        bool? withCancel  = true,
        VoidCallback? cancelOnTap,
        VoidCallback? okOnTap,
        String? okOnTapTitle = "Lanjutkan",
        String? cancelOnTapTitle = "Batalkan",
        bool? dissmissAble,
        bool? cancelable,
        String? buttonText
      }) {
    showDialog(
        context: context,
        barrierDismissible: dissmissAble ?? true,
        builder: (_) {
          if(cancelable == null) {
            cancelable = true;
          }
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            contentPadding: EdgeInsets.fromLTRB(0, 24, 0, 0),
            content: Container(
              width: UiHelpers.getWidthPageSize(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff373743),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),
                  if (description != "") ...[
                    SizedBox(height: 16),
                    Text(description,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: okOnTap ?? () {
                              Get.back();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5)
                                  )
                              ),
                              child: Text(okOnTapTitle ?? "",style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                              ),),
                            ),
                          )
                      ),

                      if(withCancel == true)...[
                        Expanded(
                            child: InkWell(
                              onTap: cancelOnTap ?? () {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)
                                    )
                                ),
                                child: Text(cancelOnTapTitle ?? "",style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15
                                ),),
                              ),
                            )
                        ),
                      ]

                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }


  static showLoading( BuildContext context, {
    String message = "Sedang memuat.."
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            contentPadding: EdgeInsets.fromLTRB(8, 14, 8, 10),
            content: Container(
              width: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //     child: Lottie.asset('assets/lottie/loading.json',width: 80)
                  // ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Center(
                        child: CircularProgressIndicator(
                          color: CustomTheme.primaryColor,
                        ),
                    ),
                  ),
                  Center(
                    child: Text("${message}"),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        });
  }

  static showSnackBar(BuildContext context, {
    required SnackBarMode snackBarMode,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        content,
        style: TextStyle(
            color: snackBarMode == SnackBarMode.SUCCESS ? const Color(0xff22AA5F) : const Color(0xffB61616)
        ),
      ),
      backgroundColor: snackBarMode == SnackBarMode.SUCCESS ? const Color(0xffAAEEC9) : const Color(0xffFFB7B7),
      behavior: SnackBarBehavior.floating,
      elevation: 0.2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9)
      ) ,
    ));
  }
}

String getFileNameFromPath(String path) {
  String base = basename(path);
  return base.split("/").last;
}

enum SnackBarMode {
  ERROR,
  SUCCESS
}

class RoundedFormClipPath extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
   double w = size.width;
   double h = size.height;

   final path = Path();
   path.lineTo(0, h);
   path.quadraticBezierTo(w * 0.5 , h - 100, w, h);
   path.lineTo(w, h);
   path.lineTo(w, 0);
   path.close();
   
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
