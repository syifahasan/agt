import 'package:flutter/material.dart';
import 'package:authentic_guards/auth/login.dart';
import 'package:authentic_guards/auth/FormInput.dart';
import 'package:authentic_guards/auth/login.dart';

class PageRegis extends StatefulWidget {
  const PageRegis({Key? key}) : super(key: key);

  @override
  State<PageRegis> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<PageRegis> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final appBarSize = AppBar().preferredSize.height;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset('assets/other/bg.png').image,
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 0,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: appBarSize,
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: isKeyboard ? 0 : h * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.45),
              topRight: Radius.circular(w * 0.45),
            ),
            child: Container(
                width: w,
                height: h,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: w * 0.3,
                    ),
                    Text("Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.11,
                        )),
                    Text("he Gateway to everything authentic",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: w * 0.045,
                        )),
                    SizedBox(height: w * 0.065),
                    Container(
                      child: InputForm(
                        labelText: 'Enter Email',
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      child: InputForm(
                        labelText: "Enter phone number",
                        keyboardType: TextInputType.number,
                        hintText: "Enter phone number",
                      ),
                    ),
                    Container(
                      child: InputForm(
                        labelText: "Password",
                        hintText: "Password",
                        obscureText: true,
                      ),
                    ),
                    Container(
                      child: InputForm(
                        labelText: "Re-enter Password",
                        hintText: 'Re-enter Password',
                        obscureText: true,
                      ),
                    ),
                    Container(
                      width: w * 0.35,
                      padding: EdgeInsets.only(top: w * 0.05),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PageLogin();
                          }));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: w * 0.04, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFEEEDED)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(w * 0.05)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: w * 0.1),
                        child: RichText(
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Text("Already have an account?",
                                      style: TextStyle(
                                          fontSize: w * 0.035,
                                          fontWeight: FontWeight.w400))),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageLogin();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontSize: w * 0.04,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
          ),
        ),
        if (!isKeyboard) ...[
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/other/logo.png'),
                height: 165,
                width: 165,
              ),
            ),
          ),
        ],
      ],
    ));
  }
}

class RoundedClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.largest;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
