import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/notification.dart';
import '../pages/profile.dart';
import '../pages/scanner.dart';
import '../pages/store.dart';
import '../pages/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 0;
  final screens = [
    HomePage(),
    StorePage(),
    ScannerPage(),
    NotifPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          leading: null,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                gradient: RadialGradient(
                  colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
                  center: Alignment.topCenter,
                  radius: 10,
                )),
          ),
          // backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 4),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  width: screenWidth * 50 / 100,
                  height: 30,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                    ),
                    onSubmitted: (value) {
                      // Perform search based on the input value
                      print('Search query: $value');
                    },
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ], borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300?grayscale'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: _currentPage == 0
                ? Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 181, 136, 59),
                  )
                : Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 1
                ? SvgPicture.asset(
                    'assets/icons/navbar/StoreSelected.svg',
                  )
                : SvgPicture.asset('assets/icons/navbar/Store.svg'),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 2
                ? SvgPicture.asset('assets/icons/navbar/Scanner.svg',
                    color: Color.fromARGB(255, 181, 136, 59))
                : SvgPicture.asset('assets/icons/navbar/Scanner.svg'),
            label: "Scanner",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 3
                ? Icon(
                    Icons.notifications,
                    color: Color.fromARGB(255, 181, 136, 59),
                  )
                : Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 4
                ? Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 181, 136, 59),
                  )
                : Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
