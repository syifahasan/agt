import 'package:authentic_guards/pages/store/favoritePage.dart';
import 'package:flutter/material.dart';
import 'myCart.dart';
import 'package:authentic_guards/utils/payment/currencyFormat.dart';
import 'package:provider/provider.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({
    super.key,
    required this.itempic,
    required this.price,
    required this.itemname,
    required this.colors,
  });
  final String itempic;
  final double price;
  final String itemname;
  final List<Color> colors;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final bool isSelected = false;
  String selectedSize = '';

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
                image: AssetImage(widget.itempic),
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
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Text(
                      widget.itemname,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      CurrencyFormat.convertToIdr(widget.price, 2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 5 / 100,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD946),
                          size: screenWidth * 5.5 / 100,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD946),
                          size: screenWidth * 5.5 / 100,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD946),
                          size: screenWidth * 5.5 / 100,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD946),
                          size: screenWidth * 5.5 / 100,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD946),
                          size: screenWidth * 5.5 / 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('5.0'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '(100)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemDesc(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Colors',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 5 / 100),
                    ),
                  ),
                  ColorsVariant(
                    screenWidth: screenWidth,
                    colors: widget.colors,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Sizes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 5 / 100),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Sizes(
                            screenWidth: screenWidth,
                            size: 'S',
                            isSelected: selectedSize == 'S',
                            onSizeSelected: () {
                              setState(() {
                                if (selectedSize == 'S') {
                                  selectedSize = '';
                                } else {
                                  selectedSize = 'S';
                                }
                              });
                            }),
                        Sizes(
                            screenWidth: screenWidth,
                            size: 'M',
                            isSelected: selectedSize == 'M',
                            onSizeSelected: () {
                              setState(() {
                                if (selectedSize == 'M') {
                                  selectedSize = '';
                                } else {
                                  selectedSize = 'M';
                                }
                              });
                            }),
                        Sizes(
                            screenWidth: screenWidth,
                            size: 'L',
                            isSelected: selectedSize == 'L',
                            onSizeSelected: () {
                              setState(() {
                                if (selectedSize == 'L') {
                                  selectedSize = '';
                                } else {
                                  selectedSize = 'L';
                                }
                              });
                            }),
                        Sizes(
                            screenWidth: screenWidth,
                            size: 'XL',
                            isSelected: selectedSize == 'XL',
                            onSizeSelected: () {
                              setState(() {
                                if (selectedSize == 'XL') {
                                  selectedSize = '';
                                } else {
                                  selectedSize = 'XL';
                                }
                              });
                            }),
                        Sizes(
                            screenWidth: screenWidth,
                            size: '2XL',
                            isSelected: selectedSize == '2XL',
                            onSizeSelected: () {
                              setState(() {
                                if (selectedSize == '2XL') {
                                  selectedSize = '';
                                } else {
                                  selectedSize = '2XL';
                                }
                              });
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                isExtended: true,
                backgroundColor: Colors.grey,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  ),
                },
                label: Container(
                  width: screenWidth * 20 / 100,
                  child: Icon(
                    Icons.bookmark_add_outlined,
                    size: screenWidth * 10 / 100,
                    color: Colors.white,
                  ),
                ),
                heroTag: "fab1",
              ),
              FloatingActionButton.extended(
                backgroundColor: Color(0xffFF6161),
                onPressed: () {
                  if (selectedSize == '') {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        content: Text(
                          'choose the size first',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                        content: Text('product added to cart'),
                      ),
                    );
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    cartProvider.addToCart(
                      CartItem(
                        itempic: widget.itempic,
                        price: widget.price,
                        itemname: widget.itemname,
                        colors: widget.colors,
                        selectedSize: selectedSize,
                        onCheckedChanged: () {
                          cartProvider.updateTotalPrice();
                        },
                      ),
                    );
                  }
                },
                label: Container(
                  width: screenWidth * 40 / 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: screenWidth * 4 / 100,
                          color: Colors.white,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Sizes extends StatefulWidget {
  const Sizes({
    super.key,
    required this.screenWidth,
    required this.size,
    required this.onSizeSelected,
    required this.isSelected,
  });

  final double screenWidth;
  final String size;
  final bool isSelected;
  final VoidCallback onSizeSelected;

  @override
  State<Sizes> createState() => _SizesState();
}

class _SizesState extends State<Sizes> {
  @override
  Widget build(BuildContext context) {
    Color containerColor = widget.isSelected ? Colors.black : Colors.white;
    Color textColor = widget.isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () {
        widget.onSizeSelected();
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        width: widget.screenWidth * 10 / 100,
        height: widget.screenWidth * 10 / 100,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.size,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}

class ColorsVariant extends StatelessWidget {
  const ColorsVariant({
    super.key,
    required this.screenWidth,
    required this.colors,
  });

  final double screenWidth;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ...colors.map((Color color) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                padding: EdgeInsets.all(3),
                width: screenWidth * 10 / 100,
                height: screenWidth * 10 / 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                    color: color,
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class ItemDesc extends StatelessWidget {
  const ItemDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('- 100% Organic cotton'),
          Text('- 6,5 oz'),
          Text('- Midweight'),
          Text('- True to size'),
          Text('- Preshrunk'),
          Text('- Side seems'),
          Text('- Design printed on front n back'),
        ],
      ),
    );
  }
}
