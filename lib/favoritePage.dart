import 'package:authentic_guards/pages/profile/editProfile.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: IconThemeData(
              size: w * 0.065,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: w * 0.25,
            pinned: false,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: w * 0.2, left: w * 0.12),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                child: Text(
                  'MY FAVORITE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                    top: w * 0.25, left: w * 0.08, right: w * 0.08),
                width: w,
                height: h,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
