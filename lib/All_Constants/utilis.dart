import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Screens/Dashboard/home_screen.dart';
import 'package:fyp_feas/All_Screens/Dashboard/search_screen.dart';

import '../All_Screens/Dashboard/profile_screen.dart';
import '../All_Screens/Dashboard/uploaditem_screen.dart';
import 'colors.dart';


class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    SearchScreen(),
    UploadScreen(),
    ProfileScreen()



  ];

  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      resizeToAvoidBottomInset: false,

      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        elevation: 1,
        iconSize: 25,
        selectedItemColor: secondarycolor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
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
      ),



    );
  }
}







//StylishBottomBar(
//
//         elevation: 2,
//         backgroundColor: Colors.white60,
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//         items: [
//           AnimatedBarItems(
//
//               icon: Icon(
//                 Icons.home_filled,
//
//                 size: 30,
//               ),
//               selectedColor: Color(0xff016DFF),
//
//               title: Text('Home')),
//           AnimatedBarItems(
//               icon: Icon(
//                 Icons.search,
//                 size: 30,
//               ),
//               selectedColor: Color(0xff016DFF),
//
//               title: Text('Add')),
//
//           AnimatedBarItems(
//               icon: Icon(
//                 Icons.list_alt_rounded,
//                 size: 30,
//               ),
//               selectedColor: Color(0xff016DFF),
//
//               title: Text('Category')),
//
//           AnimatedBarItems(
//               icon: Icon(
//                 Icons.person,
//
//                 size: 30,
//               ),
//               selectedColor: Color(0xff016DFF),
//
//
//               title: Text('Profile')),
//
//
//         ],
//
//
//         opacity: 0.3,
//         currentIndex: selected ?? 0,
//
//
//         onTap: (index) {
//           setState(() {
//             selected = index;
//           });
//         },
//
//       ), body: SafeArea(
//         child: PageView(
//           controller: controller,
//           children: const [
//             Center(child: HomePage()),
//             Center(child: HomePage()),
//             Center(child: HomePage()),
//             Center(child: ProfileScreen()),
//           ],
//         ),
//       ),
