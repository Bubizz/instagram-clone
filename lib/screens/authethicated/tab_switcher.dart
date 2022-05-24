import 'package:flutter/material.dart';
import 'package:instagram/screens/authethicated/tabs/profile.dart';
import 'package:instagram/screens/authethicated/tabs/search.dart';
import 'package:instagram/screens/authethicated/tabs/welcome.dart';

class TabSwitcher extends StatefulWidget {
  const TabSwitcher({Key? key}) : super(key: key);

  @override
  State<TabSwitcher> createState() => _TabSwitcherState();
}

class _TabSwitcherState extends State<TabSwitcher> {
  var _selectedIndex = 0;

  var pages = 
  [
    const WelcomePage(),
    const SearchScreen(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
        child: BottomNavigationBar(
          selectedIconTheme:
              const IconThemeData(color: Colors.white, size: 28, opacity: .8),
          unselectedIconTheme:
              const IconThemeData(color: Colors.white, size: 26, opacity: .8),
          iconSize: 1.0,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          backgroundColor: const Color.fromARGB(255, 53, 51, 51),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              activeIcon: Icon(
                Icons.home,
              
              ),
              icon: Icon(
                Icons.home_outlined,
                
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              activeIcon: Icon(
                Icons.search,
                
              ),
              icon: Icon(
                Icons.search_outlined,
       
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              activeIcon: Icon(
                Icons.home,
              
              ),
              icon: Icon(
                Icons.home_max_outlined,
                
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}