import 'package:flutter/material.dart';

import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:authentic_guards/auth/register.dart';
import 'package:authentic_guards/auth/FormInput.dart';
import 'package:authentic_guards/auth/siginWith.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);
  @override
  State<PageLogin> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    final appBarSize = AppBar().preferredSize.height;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/other/bg.png').image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: isKeyboard ? 0 : w * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(w * 0.45),
                  topRight: Radius.circular(w * 0.45),
                ),
                child: Container(
                  width: w,
                  height: h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: w * 0.1),
                        child: Image.asset(
                          'assets/other/logo.png',
                          width: w * 0.45,
                          height: w * 0.45,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: w * 0.05),
                        child: Text("Welcome",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: w * 0.11,
                            )),
                      ),
                      Text("The Gateway to everything authentic",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.045,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: w * 0.05),
                        child: InputForm(
                          labelText: 'Enter Email',
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                          child: InputForm(
                        labelText: 'Enter Password',
                        hintText: 'Password',
                        obscureText: true,
                      )),
                      Container(
                        width: w * 0.35,
                        padding: EdgeInsets.only(top: w * 0.05),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainPage();
                            }));
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: w * 0.04, color: Colors.black)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 131, 109, 109)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(w * 0.05)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: siginWith(),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: RichText(
                            overflow: TextOverflow.fade,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Text("Don't have an account?",
                                        style: TextStyle(
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w400))),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PageRegis();
                                      }));
                                    },
                                    child: Text(" Sign Up",
                                        style: TextStyle(
                                            fontSize: w * 0.04,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

