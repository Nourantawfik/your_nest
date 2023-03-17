//
//
// import 'package:flutter/material.dart';
//
// class Utils {
//   // Utils(TextButton text);
//   //
//   //  showPicker(Context , TextButton())
//   //  {
//   //     return (Text(' '));
//   //  }
// Color colortitle = Colors.orange;
//
// }

//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class Utils extends StatefulWidget {


  //const StreamScreean({Key? key}) : super(key: key);



  @override
  State<Utils> createState() => _UtilsState();
}

class _UtilsState extends State<Utils> {


  final  Stream<QuerySnapshot> dataStream =FirebaseFirestore.instance.collection('items').snapshots() ;
  String led = '0' ;


  final List storedocs = [];
   // snapshot.data!.docs.map((DocumentSnapshot document ) {
   // Map a = document.data() as Map <String , dynamic>;
   // storedocs.add(a);
   // a['id'] =document.id ;
   // }).toList() ;


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
      if (storedocs[hashCode] ['light sensor'] =='ON') {
        // led == '1';
        print('ON');
      }
      //});
      //setState(() {
      // else if (led != '0') {
      //   led == '0' ;
      //   print('OFF') ;
      // }
      // 1,0
    });
    flutterLocalNotificationsPlugin.show( 0,
        'Testing ' ,
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

      final  Stream<QuerySnapshot> dataStream =FirebaseFirestore.instance.collection('items').snapshots() ;

    return Scaffold( backgroundColor: Colors.grey[800] ,
    appBar: AppBar(
    backgroundColor:Colors.orange[800] ,
        centerTitle: true,
        title: Text('SENSORS' , style: TextStyle(fontSize: 25),),
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
    stream:  dataStream,
    builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {

    if (snapshot.hasError) {
    return Container( child:
    Text(snapshot.error.toString())
    );

    // ToDo: add snackbar
    }
    if (snapshot.connectionState == ConnectionState.waiting) {

    return const Center(
    child:  CircularProgressIndicator(),

    );
    }
    final List storedocs = [];
    snapshot.data!.docs.map((DocumentSnapshot document ) {
    Map a = document.data() as Map <String , dynamic>;
    storedocs.add(a);
    a['id'] =document.id ;
    }).toList() ;

    return Column(
    children:
    List.generate(
    storedocs.length ,
    (index) => Container(
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
    height: 50,width: double.infinity,
    decoration: BoxDecoration(color: Colors.orange[300],borderRadius: BorderRadius.circular(250)
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView( scrollDirection: Axis.horizontal,
    child: Row(children: [
    Text('Temp Sensor :' , style: TextStyle(fontSize: 20 , color: Colors.orange[900] ,
    fontWeight: FontWeight.bold),)
    , SizedBox(width: 20,),
    Text(storedocs[index] ['text'] ,  style: TextStyle(fontSize: 25 ,
    fontWeight: FontWeight.bold),)]),
    ),
    ),
    ),
    ),

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

    SizedBox(height: 15,) ,

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    height: 50,width: double.infinity,
    decoration: BoxDecoration(color: Colors.orange[300],borderRadius: BorderRadius.circular(250)
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView( scrollDirection: Axis.horizontal,
    child: Row(children: [
    Text('Moisture, Gas Sensor :' , style: TextStyle(fontSize: 20 , color: Colors.orange[900]
    , fontWeight: FontWeight.bold),)
    , SizedBox(width: 20,),
    Text(storedocs[index] ['Moisture, gas sensor'] ,  style: TextStyle(fontSize: 25 ,
    fontWeight: FontWeight.bold),)]),
    ),
    ),
    ),
    ),

    SizedBox(height: 15,) ,

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    height: 50,
    decoration: BoxDecoration(color: Colors.orange[300],borderRadius: BorderRadius.circular(250)
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView( scrollDirection: Axis.horizontal,
    child: Row(children: [
    Text('Light Sensor :' , style: TextStyle(fontSize: 20 , color: Colors.orange[900],
    fontWeight: FontWeight.bold),)
    , SizedBox(width: 20,),
    Text(storedocs[index] ['light sensor'] ,  style: TextStyle(fontSize: 25 ,
    fontWeight: FontWeight.bold),)

  //        .((queryDocSnapshot) =>queryDocSnapshot.data()['display']).map((queryDocSnapshot) {
  //   if (queryDocSnapshot.data()['light sensor'] == "On") {
  //   Positioned(
  //   child:IconButton(
  //   onPressed:() {},
  // //  colourData: Colors.green,
  //   icon: IconData(queryDocSnapshot.data()['ref'],
  //   ),
  //   ),
  //   );
  //   } else if (queryDocSnapshot.data()['colour'] == "red") {
  //   Positioned(
  //   child:MoodButton(
  //   onTap:() {},
  //   colourData: Colors.red,
  //   iconData: IconData(queryDocSnapshot.data()['ref'],
  //   ),
  //   ),
  //   );

//
//      // if (storedocs[index] ['light sensor'] == 'On')
//

    ]),
    ),
    ),
    ),
    ),
//
//     //   Text(storedocs[index] ['light sensor'] ,  style: TextStyle(fontSize: 25 ,
//     //       fontWeight: FontWeight.bold),)),
//     // ),
//
    ],
    ),
    ),
    ),
    ),
    ),
    //]
    );
    } ,

    ),
    ],
    ),
    ),
    ) ;
    }

  }

