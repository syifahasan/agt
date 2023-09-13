import 'package:authentic_guards/pages/store/favoritePage.dart';
import 'package:authentic_guards/utils/payment/topUpMethod.dart';
import 'package:authentic_guards/utils/payment/currencyFormat.dart';
import 'package:flutter/material.dart';
import 'paymentPage.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key, required this.cartItems});
  final List<CartItem> cartItems;

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            iconTheme:
                IconThemeData(color: Colors.white, size: screenWidth * 0.065),
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 20 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 30),
                    height: screenHeight * 20 / 100,
                    // A container for the flexible space (background) of the AppBar
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(),
                      child: Row(
                        children: [
                          Text(
                            'MY CART',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.09,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 85, right: 30),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoritePage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: screenWidth * 0.12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 90,
                ),
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                            final cartItems = cartProvider.items;
                            if (cartItems.isEmpty) {
                              return Center(
                                child: Text(
                                  'this cart empty',
                                ),
                              );
                            }
                            return Cart(cartItems: cartItems);
                          },
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
      floatingActionButton: Container(
        height: screenWidth * 45 / 100,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.08, right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Total'),
                  ),
                  Container(
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        final cartItems = cartProvider.items;
                        final totalPrice = cartProvider.totalPrice;
                        return Text(
                          CurrencyFormat.convertToIdr(totalPrice, 2),
                          style: TextStyle(fontWeight: FontWeight.w700),
                        );

                        // return Text(
                        //   cartItems.isEmpty
                        //       ? 'Rp. 0'
                        //       : 'Rp. ${cartProvider.totalPrice.toStringAsFixed(2)}',
                        //   style: TextStyle(fontWeight: FontWeight.w700),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xffFF6161),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                );
              },
              label: Container(
                width: screenWidth * 70 / 100,
                child: Center(
                  child: Text(
                    'Continue Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key, required this.cartItems});
  final List<CartItem> cartItems;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          for (var cartItem in widget.cartItems)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: screenWidth * 0.0025,
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffD9d9d9),
                    ),
                    child: Checkbox(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: Colors.black,
                      value: cartItem.isChecked,
                      onChanged: (newValue) {
                        cartItem.setChecked(newValue ?? false);
                        Provider.of<CartProvider>(context, listen: false)
                            .updateTotalPrice();
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: screenWidth * 0.02,
                  child: Container(
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      child: Image.asset(cartItem.itempic)),
                ),
                Container(
                  width: screenWidth * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          cartItem.itemname,
                          style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: screenWidth * 0.02,
                        ),
                        child: Text(
                          'Size: ${cartItem.selectedSize}',
                          style: TextStyle(
                              fontSize: screenWidth * 0.025,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: screenWidth * 0.02,
                        ),
                        child: Text(
                          CurrencyFormat.convertToIdr(cartItem.price, 2),
                          style: TextStyle(
                              fontSize: screenWidth * 0.030,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                IconCounter(
                  quantity: cartItem.quantity,
                  onIncrement: () {
                    setState(() {
                      cartItem.quantity++;
                      Provider.of<CartProvider>(context, listen: false)
                          .updateTotalPrice();
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (cartItem.quantity > 1) {
                        cartItem.quantity--;
                        Provider.of<CartProvider>(context, listen: false)
                            .updateTotalPrice();
                      }
                    });
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class IconCounter extends StatefulWidget {
  const IconCounter(
      {super.key,
      required this.quantity,
      required this.onIncrement,
      required this.onDecrement});
  final int quantity;
  final Function() onIncrement;
  final Function() onDecrement;

  @override
  State<IconCounter> createState() => _IconCounterState();
}

class _IconCounterState extends State<IconCounter> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.30,
      height: screenWidth * 0.08,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth * 0.015),
        ),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove, size: screenWidth * 0.025),
              onPressed: widget.onDecrement,
            ),
            Text(
              widget.quantity.toString(),
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add, size: screenWidth * 0.025),
              onPressed: widget.onIncrement,
            ),
          ],
        ),
      ),
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
