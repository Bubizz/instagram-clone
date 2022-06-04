import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    SearchScreen(),
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
          items:  <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              label: '',
              activeIcon: Icon(
                Icons.home,
              
              ),
              icon: Icon(
                Icons.home_outlined,
                
              ),
            ),
            const BottomNavigationBarItem(
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
              icon: CircleAvatar(backgroundImage: NetworkImage(Provider.of<User>(context).photoURL ?? 'https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg',),   radius: 16.0, ),
              activeIcon: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: const BorderRadius.all(Radius.circular(100)),),
                child: CircleAvatar(backgroundImage: NetworkImage(Provider.of<User>(context).photoURL ?? 'https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg',),   radius: 16.0, )),
              ),
            
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
