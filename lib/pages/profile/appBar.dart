import 'package:authentic_guards/pages/setting.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool iconbar;

  CustomAppBar({this.title = "Default Title", this.iconbar = false});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AppBar(
      centerTitle: true,
      elevation: 5,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: w * 0.065),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(w * 0.05)),
          gradient: RadialGradient(
            colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
            center: Alignment.topCenter,
            radius: w * 0.055,
          ),
        ),
      ),
      toolbarHeight: w * 0.16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(w * 0.1),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: w * 0.045,
        ),
      ),
      actions: [
        if (iconbar)
          Container(
            margin: EdgeInsets.only(right: w * 0.025),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return settingPage();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight * 1.2); // Ukuran default AppBar
}
