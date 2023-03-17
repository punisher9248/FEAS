import 'package:flutter/material.dart';
import '../All_Screens/Dashboard/home_screen.dart';
import '../All_Screens/Dashboard/profile_screen.dart';
import '../All_Screens/Dashboard/search_screen.dart';
import '../All_Screens/Dashboard/uploaditem_screen.dart';


class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {

  int _selectedIndex = 0;
  bool isLoading=true;

  List _pages = [
        HomeScreen(),
    SearchScreen(),
    UploadScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
          gradient: LinearGradient(
            colors: [Color(0xFF56d1ab), Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.1, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,

          // onTap: _onItemTapped,
        ),
      ),

      body: _pages[_selectedIndex],


    );
  }
}
