import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage(
      {super.key,
      required this.itempic,
      required this.price,
      required this.itemname});
  final String itempic;
  final String price;
  final String itemname;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined),
                  color: Colors.black,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: false,
            expandedHeight: screenWidth * 1.1,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(itempic),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      itemname,
                      style: TextStyle(
                        fontSize: screenWidth * 6 / 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Garment Dyed T-Shirt',
                      style: TextStyle(
                        fontSize: screenWidth * 4.5 / 100,
                      ),
                    ),
                  ),
                  Text(
                    'Rp. ${price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 5.5 / 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              isExtended: true,
              backgroundColor: Colors.grey,
              onPressed: () => {},
              label: Container(
                width: screenWidth * 20 / 100,
                child: Icon(Icons.bookmark_add_outlined,
                    size: screenWidth * 10 / 100),
              ),
              heroTag: "fab1",
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xffFF6161),
              onPressed: () => {},
              label: Container(
                width: screenWidth * 40 / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: screenWidth * 4 / 100,
                      ),
                    ),
                  ],
                ),
              ),
              heroTag: "fab2",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
