import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'main.dart';

String? uId ='';
int fire = 50;

void showNotification() {
  /*
    setState(() {
      if (led == '0') {
        led == '1';
        print('ON');
      }
    //});
        //setState(() {
      else if (led != '0') {
        led == '0' ;
        print('OFF') ;
      }
      // 1,0
    });
    */
  flutterLocalNotificationsPlugin.show( 0,
      'Testing 1' ,
      'How you doing ?' ,NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id ,
          channel.name ,
          // channel.description,
          color:Colors.blue ,
          importance: Importance.high,
          playSound: true ,
          icon:'@mipmap/ic_launcher',
        ),
      )) ;

}