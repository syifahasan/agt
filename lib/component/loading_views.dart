import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadingViews extends StatelessWidget {
  const LoadingViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Container(
           alignment: Alignment.center,
           child: Lottie.asset('assets/lottie/loading.json',width: 200),
         ),
          Text("Sedang Memuat...",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20
          ),)
        ],
      ),
    );
  }
}
