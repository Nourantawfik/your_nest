import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class StreamScreean extends StatefulWidget {

  //const StreamScreean({Key? key}) : super(key: key);

 // String led = '0' ;
 //
 //  get context => null;
 //  @override
 //  void initState() {
 //    // TODO: implement initState
 //    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
 //      RemoteNotification? notification = message.notification ;
 //      AndroidNotification? android =message.notification?.android;
 //
 //      if (notification != null  && android != null) {
 //        flutterLocalNotificationsPlugin.show(
 //            notification.hashCode ,
 //            notification.title ,
 //            notification. body ,
 //            NotificationDetails(
 //              android: AndroidNotificationDetails(
 //                channel.id ,
 //                channel.name ,
 //                // channel.description,
 //                color:Colors.blue ,
 //                playSound: true ,
 //                icon:'@mipmap/ic_launcher',
 //              ),
 //            )
 //        ) ;
 //      }
 //    });
 //    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
 //      print('A new onMessageOpenApp event was published!');
 //      RemoteNotification? notification = message.notification ;
 //      AndroidNotification? android =message.notification?.android;
 //      if (notification != null  && android != null) {
 //
 //        showDialog(context: context, builder:(_){
 //          return AlertDialog(
 //            title: Text('notification.title'),
 //            content: SingleChildScrollView(
 //              child: Column(
 //                crossAxisAlignment: CrossAxisAlignment.start,
 //                children: [
 //                  Text('notification.body') ,
 //                ],
 //              ),
 //            ),
 //          );
 //        } );
 //      }
 //    });
 //  }
 //
 //
 //  void showNotification(){}

  @override
  State<StreamScreean> createState() => _StreamScreeanState();
}

class _StreamScreeanState extends State<StreamScreean> {

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> dataStream = FirebaseFirestore.instance.collection('items').snapshots();

    return Scaffold(backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        centerTitle: true,
        title: Text('SENSORS', style: TextStyle(fontSize: 25),),
        //   actions:
        // [
        //   MaterialButton( onPressed: () {
        //
        //   }, child: Text('SENSOR'),),
        // ],
      ),


      body:

      SingleChildScrollView(

        child: Column(

          children: [
            StreamBuilder<QuerySnapshot>(
              stream: dataStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Container(child:
                  Text(snapshot.error.toString())
                  );

                  // ToDo: add snackbar
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),

                  );
                }

                final List storedocs = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map a = document.data() as Map <String, dynamic>;
                  storedocs.add(a);
                  a['id'] = document.id;
                }).toList();

                return Column(
                  children:
                  List.generate(
                    storedocs.length,
                        (index) =>
                        Container(
                          padding: EdgeInsetsDirectional.all(0.8),
                          width: double.infinity,
                          height: 500,

                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  // SizedBox(height: 15,) ,

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50, //width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              250)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            Text('Temp Sensor :',
                                              style: TextStyle(fontSize: 20,
                                                  color: Colors.orange[900],
                                                  fontWeight: FontWeight.bold),)
                                            , SizedBox(width: 20,),
                                            Text(storedocs[index] ['temp'],
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),)
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // if (storedocs[index] ['light sensor']  == "On" )
                                  //
                                  //       showNotification(),

                                  // if (storedocs[index] ['Moisture, gas sensor'] == "50c , 40C")
                                  //   Container(
                                  //     color: Colors.red,
                                  //   ),


                                  // SizedBox(height: 15,) ,
                                  //
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //       decoration: BoxDecoration(color: Colors.orange[300],borderRadius: BorderRadius.circular(250)
                                  //
                                  //       ),child: Text(storedocs[index] ['trueOrFalse'] ,  style: TextStyle(fontSize: 25 ,
                                  //       fontWeight: FontWeight.bold),)),
                                  // ),

                                  SizedBox(height: 15,),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50, //width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              250)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            Text('Flame :',
                                              style: TextStyle(fontSize: 20,
                                                  color: Colors.orange[900]
                                                  ,
                                                  fontWeight: FontWeight.bold),)
                                            , SizedBox(width: 20,),
                                            Text(
                                              storedocs[index] ['flame'],
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),)
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15,),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              250)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            Text('Light Sensor :',
                                              style: TextStyle(fontSize: 20,
                                                  color: Colors.orange[900],
                                                  fontWeight: FontWeight.bold),)
                                            , SizedBox(width: 20,),
                                            Text(
                                              storedocs[index] ['light sensor'],
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),)
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //   Text(storedocs[index] ['light sensor'] ,  style: TextStyle(fontSize: 25 ,
                                  //       fontWeight: FontWeight.bold),)),
                                  // ),

                                  SizedBox(height: 15,),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50, //width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              250)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            Text(' Gas :',
                                              style: TextStyle(fontSize: 20,
                                                  color: Colors.orange[900]
                                                  ,
                                                  fontWeight: FontWeight.bold),)
                                            , SizedBox(width: 20,),
                                            Text(
                                              storedocs[index] ['gas'],
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),)
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),


                                  SizedBox(height: 15,),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50, //width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              250)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            Text('Moisture :',
                                              style: TextStyle(fontSize: 20,
                                                  color: Colors.orange[900]
                                                  ,
                                                  fontWeight: FontWeight.bold),)
                                            , SizedBox(width: 20,),
                                            Text(
                                              storedocs[index] ['moisture'],
                                              style: TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),)
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                  //]
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}
//
//   showNotification()  {
//     setState(() {
//       var led = '0';
//       if ( led == '0') {
//         led == '1';
//         print('ON');
//       }
//       //});
//       //setState(() {
//       else if (led != '0') {
//         led == '0' ;
//         print('OFF') ;
//       }
//       // 1,0
//     });
//     flutterLocalNotificationsPlugin.show( 0,
//         'Testing' ,
//         'How you doing ?' ,NotificationDetails(
//
//           android: AndroidNotificationDetails(
//             channel.id ,
//             channel.name ,
//             // channel.description,
//             color:Colors.blue ,
//             playSound: true ,
//             icon:'@mipmap/ic_launcher',
//           ),
//         )) ;
//   }
// }
