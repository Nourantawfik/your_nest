
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late DatabaseReference _dbref;
//   String databasejson = '';
//   var newSensor;
//   var newSensor2;
//   var status;
//
//   _createDB() {
//     _dbref.child("profile").set(" my profile");
//     _dbref
//         .child("carprofile")
//         .set({'car1': "family car", 'car2': "company car"});
//   }
//
//   _readdb_onechild() {
//     _dbref
//         .child("sensor1")
//         .child("temp")
//         .once()
//         .then(DataSnapshot dataSnapshot) {
//
//       print(" read once - " + dataSnapshot.value.toString());
//
//       setState(() {
//         databasejson = dataSnapshot.value.toString();
//       });
//     };
//   }
//
//   // _realdb_once() {
//   //   _dbref.once().then((DataSnapshot dataSnapshot) {
//   //     print(" read once - " + dataSnapshot.value.toString());
//   //     setState(() {
//   //       databasejson = dataSnapshot.value.toString();
//   //     });
//   //   });
//   // }
//
//   _updatevalue() {
//     _dbref.child("carprofile").update({"car2": "big company car"});
//   }
//
//   // _delete() {
//   //   _dbref.child("profile").remove();
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     _dbref = FirebaseDatabase.instance.reference();
//     _readdb_onechild();
//     ageChange();
//     dataChange();
//     _createDB();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             buildText('Sensor is $databasejson'),
//             buildText('New Sensor is: $newSensor'),
//             buildText('New Sensor is: $newSensor2'),
//             buildText('New Status is: $status'),
//             StreamBuilder(
//               stream: _dbref.onValue,
//               builder: (context, AsyncSnapshot snap) {
//                 if (snap.hasData &&
//                     !snap.hasError &&
//                     snap.data.snapshot.value != null) {
//                   Map data = snap.data.snapshot.value;
//                   List item = [];
//                   data.forEach(
//                           (index, data) => item.add({"key": index, ...data}));
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: item.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text("Sensors: ${item[index]['key']}"),
//                           subtitle: Text(
//                               'Sensor: ${item[index]['sensor'].toString()} \nStatus: ${item[index]['status']}'),
//                           isThreeLine: true,
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   return Center(child: Text("No data"));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Text buildText(String s) {
//     return Text(
//       s,
//       style: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//   void ageChange() {
//     /*
//        var subscription = FirebaseDatabase.instance
//       .reference()
//       .child('messages')
//       .Xxx
//       .listen((event) {
//         // process event
//       });
//       where Xxx is one of
//       onvalue
//       onChildAdded
//       onChildRemoved
//       onChildChanged
//       To end the subscription you can use
//       subscription.cancel();
//     */
//     _dbref.child('sensor1').child('sensor').onValue.listen((Event event) {
//       int data = event.snapshot.value;
//       print('weight data: $data');
//       setState(() {
//         newSensor = data;
//       });
//     });
//   }
//
//   void dataChange() {
//     _dbref.child('sensor1').onValue.listen((event) {
//       print(event.snapshot.value.toString());
//       Object? data = event.snapshot.value;
//       data.forEach((key, value) {
//         setState(() {
//           newSensor2 = data['sensor'];
//           status = data['status'];
//         });
//       });
//     });
//   }
// }