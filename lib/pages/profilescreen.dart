// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../services/auth_service.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             FutureBuilder(
//               future: Provider.of(context,listen: false).Auth.getCurrentUser(),
//               builder: (context, snapshot)  {
//                 if(snapshot.connectionState == ConnectionState.done){
//                   return displayUserInformation(context, snapshot) ;
//                 }
//                 else {
//                   return CircularProgressIndicator();
//                 }
//               }) ,
//           ],
//         ),
//       ),
//     );
//   }
//
//    displayUserInformation(context, snapshot){
//     final user = snapshot.data ;
//   return Column(children: [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(' Name : ${user.displayName}' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(' Email : ${user.email}' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
//     ),
//
//   ],);
//
//
//
//
//   }
// }


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:your_nest/main.dart';
import 'package:your_nest/pages/control/roomcontrol.dart';
import 'package:your_nest/streambuilder/streambuilder.dart';


class Notify extends StatefulWidget {
  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
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

  void showNotification() {
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
    flutterLocalNotificationsPlugin.show( 0,
        'Testing $led' ,
        'How you doing ?' ,NotificationDetails(

          android: AndroidNotificationDetails(
            channel.id ,
            channel.name ,
            // channel.description,
            color:Colors.blue ,
            playSound: true ,
            icon:'@mipmap/ic_launcher',
          ),
        )) ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

    ),
    );

  }
}
