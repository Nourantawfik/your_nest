
import 'package:flutter/material.dart';
import 'package:your_nest/pages/profile/profilepage.dart';
import 'package:your_nest/pages/rateuspage.dart';

class MyHouse extends StatefulWidget {
  @override
  State<MyHouse> createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  int currentIndex = 0 ;
  List <Widget> screens =[
    MyHouse(),
    ProfileScreen() ,
    RateUsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800] ,



        body:
        Center(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // screens[currentIndex],
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('My House' ,style: TextStyle(color: Colors.orange[300] , fontWeight: FontWeight.bold, fontSize: 25),),
                ),
                SizedBox(height: 20,) ,

                Container(
                  height:100, width: 100,
                  color: Colors.black38,
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: Icon(Icons.home_work ,)),
                ),

                SizedBox(height: 100,),

                Container(

                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[300],
                  ),
                  child: MaterialButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    onPressed: () {} , child: Text('Avg Temp Sensor' ,style: TextStyle(color: Colors.black),),),

                ) ,
                SizedBox(height: 50,),

                Container(

                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[300],
                  ),
                  child: MaterialButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    onPressed: () {} , child: Text('Motion Sensor' ,style: TextStyle(color: Colors.black),),),

                ) ,

                SizedBox(height: 50,),

                Container(

                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[300],
                  ),
                  child: MaterialButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    onPressed: () {} , child: Text('PIR Sensor' ,style: TextStyle(color: Colors.black),),),

                ) ,


              ],),
          ),
        ),
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
      ),
    );
  }
}