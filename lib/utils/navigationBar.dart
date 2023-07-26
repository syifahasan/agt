import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  final PanelController _panelController = PanelController();

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
                ? Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/HomeSelected.svg',
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 181, 136, 59),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/Home.svg',
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 1
                ? Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/StoreSelected.svg',
                      ),
                      Text(
                        "Store",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 181, 136, 59),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/Store.svg',
                      ),
                      Text(
                        'Store',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 2
                ? Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/ScannerSeleted.svg',
                      ),
                      Text(
                        "Scanner",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 181, 136, 59),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/Scanner.svg',
                      ),
                      Text(
                        'Scanner',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
            label: "Scanner",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 3
                ? Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/NotificationSelected.svg',
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 181, 136, 59),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/Notification.svg',
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: _currentPage == 4
                ? Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/ProfileSelected.svg',
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 181, 136, 59),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/navbar/Profile.svg',
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
