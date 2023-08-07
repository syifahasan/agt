import 'package:authentic_guards/pages/TopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopUpMethod extends StatelessWidget {
  const TopUpMethod({super.key, required this.slug});
  final String slug;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    String textToCopy = '3901 081 0000 0000';
    void copyToClipboard(String textToCopy) {
      Clipboard.setData(ClipboardData(text: textToCopy));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 15 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 100, left: 30),
              height: screenHeight * 20 / 100,
              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                padding: EdgeInsets.only(),
                child: Text(
                  'TOP UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 120,
                  left: 30,
                  right: 30,
                ),
                width: screenWidth,
                height: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.vertical(
                  //   top: Radius.elliptical(200, 120),
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ChosedBank(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      slug: slug,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        '${slug} Virtual Account Number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 4 / 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        textToCopy,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 6 / 100,
                          color: Color(0xffFF6161),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          copyToClipboard(textToCopy);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Text copied to clipboard')),
                          );
                        },
                        child: Text('Copy Code'),
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

class ChosedBank extends StatelessWidget {
  const ChosedBank({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.slug,
  });

  final double screenWidth;
  final double screenHeight;
  final String slug;

  _getBank() {
    if (slug == 'BCA') {
      return Image.asset('assets/icons/payment/bca.png');
    } else if (slug == 'BNI') {
      return Image.asset('assets/icons/payment/bni.png');
    } else if (slug == 'Mandiri') {
      return Image.asset('assets/icons/payment/mandiri.png');
    } else {
      return Image.asset('assets/icons/payment/qris.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 90 / 100,
      height: screenHeight * 8.5 / 100,
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                width: screenWidth * 19 / 100,
                height: screenHeight * 12 / 100,
                // height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getBank(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Change'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: screenWidth * 5 / 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
