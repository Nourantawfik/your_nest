import 'package:flutter/material.dart';
import 'package:your_nest/pages/control/roomcontrol.dart';

import '../control/mainactivity.dart';
import 'settingpage.dart';

class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: Icon(Icons.home),
      ),
      endDrawer: Drawer(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20),) ,backgroundColor:Colors.grey[700],),

      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                  width: 200, height: 200,

                  child: Image.asset('assets/img/profphoto.jpg')) ,

              SizedBox(height: 10,),

              Container(
                width: 250,height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38
                ),

                child: MaterialButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage() ,));
                  } , child: Row(
                  children: [
                    Icon(Icons.lock , color: Colors.white70,) ,
                    SizedBox(width: 55,),
                    Text('Security' , style: TextStyle( fontFamily: '24' ,fontWeight: FontWeight.bold,color: Colors.white70),) ,
                    SizedBox(width: 50,),
                    Icon(Icons.arrow_forward_ios, color: Colors.white70,) ,
                  ],
                ),),
              ) ,

              SizedBox(height: 10,),

              Container(
                width: 250,height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38
                ),

                child: MaterialButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControl())) ;
                  } , child: Row(
                  children: [
                    Icon(Icons.light_rounded , color: Colors.white70,) ,
                    SizedBox(width: 55,),
                    Text('Lights' , style: TextStyle( fontFamily: '24' ,fontWeight: FontWeight.bold,color: Colors.white70),) ,
                    SizedBox(width: 60,),
                    Icon(Icons.arrow_forward_ios, color: Colors.white70,) ,
                  ],
                ),),
              ) ,
              SizedBox(height: 10,),

              Container(
                width: 250,height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38
                ),

                child: MaterialButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Home())) ;
                  } , child: Row(
                  children: [
                    Icon(Icons.sensor_door_rounded , color: Colors.white70,) ,
                    SizedBox(width: 55,),
                    Text('Lock' , style: TextStyle( fontFamily: '24' ,fontWeight: FontWeight.bold,color: Colors.white70),) ,
                    SizedBox(width: 70,),
                    Icon(Icons.arrow_forward_ios, color: Colors.white70,) ,
                  ],
                ),),
              ) ,

              SizedBox(height: 10,),

              Container(
                width: 250,height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38
                ),

                child: MaterialButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {} , child: Row(
                  children: [
                    Icon(Icons.camera , color: Colors.white70,) ,
                    SizedBox(width: 55,),
                    Text('Cameras' , style: TextStyle( fontFamily: '24' ,fontWeight: FontWeight.bold,color: Colors.white70),) ,
                    SizedBox(width: 50,),
                    Icon(Icons.arrow_forward_ios, color: Colors.white70,) ,
                  ],
                ),),
              ) ,



            ],
          ),
        ),
      ),



    );


  }
}
