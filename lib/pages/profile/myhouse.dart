import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:your_nest/main.dart';
import 'package:your_nest/pages/control/roomcontrol.dart';
import 'package:your_nest/streambuilder/streambuilder.dart';

import '../../const.dart';

class MyHouse extends StatefulWidget {
  @override
  State<MyHouse> createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  String led = '0' ;

  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification ;
      AndroidNotification? android =message.notification?.android;

      if (notification != null  && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode ,
          notification.title ,
          notification. body ,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id ,
              channel.name ,
             // channel.description,
              color:Colors.blue ,
              playSound: true ,
              icon:'@mipmap/ic_launcher',
            ),
          )
        ) ;
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenApp event was published!');
      RemoteNotification? notification = message.notification ;
      AndroidNotification? android =message.notification?.android;
      if (notification != null  && android != null) {

        showDialog(context: context, builder:(_){
          return AlertDialog(
            title: Text('notification.title'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('notification.body') ,
                ],
              ),
            ),
          );
        } );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],


        body:
        Center(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // screens[currentIndex],
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('My House', style: TextStyle(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 25),),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange[300],
                            ),
                            child: MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              onPressed: () {
                                showNotification();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StreamScreean(),));

                                print(led);
                              },
                              child:   Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text('Temp') ,
                              Text('Sensor',
                                style: TextStyle(color: Colors.black),),
                              ],),
                            ),
                          ),

                        SizedBox(width: 10,),

                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[300],
                              ),
                              child: MaterialButton(
                                clipBehavior: Clip.antiAliasWithSaveLayer,

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>StreamScreean(), ),);
                                } , child: Center(
                                  child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Moisture,') ,
                                  Text(' Gas Sensor' ,style: TextStyle(color: Colors.black),),

                                  ],
                              ),
                                ),
                            ) ,
                            ),
                          ],),
                    ),
                  ),

                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange[300],
                    ),
                    child: MaterialButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,

                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>StreamScreean(), ),);
                      },
                      child: Text(
                        'Light Sensor', style: TextStyle(color: Colors.black),),),),

                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Room', style: TextStyle(
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    ),
                  ),
                  SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20) ,
                              color: Colors.orange[300],

                            ),
                            child: MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControl())) ;

                              } , child: Text('Living room' , style: TextStyle(color: Colors.black),),),),

                          SizedBox(width: 10,),

                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20) ,
                              color: Colors.orange[300],

                            ),
                            child: MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControl())) ;
                              } , child: Text('kitchen' , style: TextStyle(color: Colors.black),),),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),

                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20) ,
                      color: Colors.orange[300],

                    ),
                    child: MaterialButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControl())) ;
                      } , child: Text('sitting room' , style: TextStyle(color: Colors.black),),),),




                ],),
            ),
          ),
        ),
      ),
    );
  }
}
