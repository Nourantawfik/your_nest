import 'package:flutter/material.dart';
import 'package:your_nest/pages/profile/profilepage.dart';
import 'package:your_nest/pages/rateuspage.dart';

import 'profile/myhouse.dart';

class BottonNavBar extends StatefulWidget {
  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int currentIndex = 0 ;
  List <Widget> screens =[
    MyHouse(),
    ProfileScreen() ,
    RateUsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800] ,
        body: screens[currentIndex] ,

        bottomNavigationBar: BottomNavigationBar( selectedItemColor:  Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home , color: Colors.black,) , label: 'Home', ),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity , color: Colors.black,) , label: 'profile'),
            BottomNavigationBarItem(icon: Icon(Icons.star , color: Colors.black ,) , label: 'Rate Us'),

          ],
          currentIndex: currentIndex ,
          onTap:(index) {
            setState(() {
              currentIndex = index;
            });
          } ,
          backgroundColor: Colors.orange[300],
        ),
    );
  }
}
