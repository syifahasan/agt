import 'package:authentic_guards/pages/notification.dart';
import 'package:flutter/material.dart';

class changePin extends StatelessWidget {
  const changePin({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(size: w * 0.065, color: Colors.white),
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight: w * 0.25, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: w * 0.2, left: w * 0.12),

              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                child: Text(
                  'CHANGE PIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.08,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: w * 0.25,
                  left: w * 0.08,
                  right: w * 0.08,
                ),
                width: w,
                height: h,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: _formProfile(
                            title: 'Enter PIN',
                            hint: 'input your PIN',
                          ),
                        ),
                        Container(
                          child: _formProfile(
                            title: 'New PIN',
                            hint: 'input your new PIN',
                          ),
                        ),
                        Container(
                          child: _formProfile(
                            title: 'Confrim PIN',
                            hint: 'input your new PIN',
                          ),
                        ),
                        Container(
                          width: w,
                          height: w * 0.12,
                          margin: EdgeInsets.only(top: w * 0.05),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Save',
                                style: TextStyle(
                                    fontSize: w * 0.04, color: Colors.white)),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffff6161)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(w * 0.06)),
                              ),
                            ),
                          ),
                        ),
                      ],
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

class _formProfile extends StatelessWidget {
  final String title;
  final String hint;
  const _formProfile({
    required this.title,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:
              EdgeInsets.only(left: w * 0.02, bottom: w * 0.025, top: w * 0.05),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.04,
            ),
          ),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          obscureText: true,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: w * 0.042),
          decoration: InputDecoration(
            // labelText: labelText,
            hintText: hint,
            labelStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
            hintStyle: TextStyle(color: Color(0xFF555555).withOpacity(0.5)),
            contentPadding: EdgeInsets.fromLTRB(15, 10.0, 20.0, 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(w * 0.03),
              borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(w * 0.03),
              borderSide: BorderSide(color: Color(0xFF555555).withOpacity(0.5)),
            ),
          ),
        )
      ],
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, h); // Starting point (bottom-left corner)
    path.lineTo(0, 80); // Left side
    path.quadraticBezierTo(
        w * 0.5, 0, w, 80); // Top with quadratic Bezier curve
    path.lineTo(w, h); // Right side
    path.close(); // Complete the shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
