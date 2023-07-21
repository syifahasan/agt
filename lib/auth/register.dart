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
          top: isKeyboard ? 0 : MediaQuery.of(context).size.height * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180), topRight: Radius.circular(180)),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Text("Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 40)),
                    Text("he Gateway to everything authentic",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                    SizedBox(height: 50),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        child: InputForm(
                          labelText: 'Enter Email',
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 18, right: 60, left: 60),
                        child: InputForm(
                          labelText: "Enter phone number",
                          keyboardType: TextInputType.number,
                          hintText: "Enter phone number",
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 18, right: 60, left: 60),
                        child: InputForm(
                          labelText: "Password",
                          hintText: "Password",
                          obscureText: true,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 18, right: 60, left: 60),
                        child: InputForm(
                          labelText: "Re-enter Password",
                          hintText: 'Re-enter Password',
                          obscureText: true,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PageLogin();
                          }));
                        },
                        child: Text('Sign Up',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFEEEDED)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 24, right: 24, top: 35, bottom: 16),
                        child: RichText(
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Text("Already have an account?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))),
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4),
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
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
