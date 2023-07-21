import 'package:flutter/material.dart';
import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:authentic_guards/pages/home.dart';
import 'package:authentic_guards/auth/register.dart';
import 'package:authentic_guards/auth/FormInput.dart';

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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/other/bg.png').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: isKeyboard ? 0 : MediaQuery.of(context).size.height * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180),
                topRight: Radius.circular(180),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 47),
                      child: Image.asset(
                        'assets/other/logo.png',
                        width: 165,
                        height: 165,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Welcome",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        )),
                    Text("The Gateway to everything authentic",
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
                          labelText: 'Enter Password',
                          hintText: 'Password',
                          obscureText: true,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MainPage();
                          }));
                        },
                        child: Text('Login',
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
                                  child: Text("Don't have an account?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))),
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PageRegis();
                                      }));
                                    },
                                    child: Text(" Sign Up",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  ),
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
    );
  }
}
