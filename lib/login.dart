import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

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
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 47),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                './assets/img/logo.png',
                                height: 165,
                                width: 165,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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

class _FormEmail extends StatelessWidget {
  const _FormEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        cursorColor: Colors.grey,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Enter Email',
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}

class _FormPass extends StatelessWidget {
  const _FormPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 18, right: 60, left: 60),
      child: TextFormField(
        obscureText: true,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
