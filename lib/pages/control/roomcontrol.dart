import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:firebase_database/firebase_database.dart';

class RoomControl extends StatefulWidget {

  // late String app;
  //
  // RoomControl(String a, this.a) {
  //
  //   this.app = a ;
  // }

  // RoomControl()  ;

  // final FirebaseApp app ;
  // late String? app;
  // RoomControl({this.app});
  // late FirebaseApp firebaseApp ;

  @override
  State<RoomControl> createState() => _RoomControlState();

}

class _RoomControlState extends State<RoomControl> {

  final referenceDatabase = FirebaseDatabase.instance ;

  List buttonsState = List.generate(6, (index) => false);


  @override
  void initState() {
    // TODO: implement initState
    initialButtons();
    super.initState();
  }

  initialButtons(){

    referenceDatabase.ref().child('output').get().then((value) {

      for(int i = 0 ; i <6  ; i++){
        buttonsState[i] = value.child('state-$i').value;
      }
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final ref = referenceDatabase.ref() ;
    //final ref = referenceDatabase.ref() ;

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text('Control Room' , style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.keyboard_control_outlined , color: Colors.black,),
          )
        ],
      ),
      // body: FutureBuilder(future: Firebase.initializeApp() ,
      // builder: (context,snapshot)
      // {
      //
      //   if (snapshot.hasError){
      //     return Center(child: Container(color: Colors.red, child: Text('Errore'),));
      //   }
      //   if (snapshot.connectionState == ConnectionState.done) {
      //     return Center(
      //       child: Container(
      //         color: Colors.green,child: Text('Connected'),
      //       ),
      //     );}
      //
      //     return Center(child: Container(color: Colors.grey)) ;
      //
    body:  SingleChildScrollView(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              child: ListView.builder(
                itemCount: buttonsState.length ,
                  //4,
                  itemBuilder: (context , item){return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: FlutterSwitch(
                      width: 150.0,
                      height: 70.0,
                      toggleSize: 50.0,
                      borderRadius: 30.0,
                      value: buttonsState[item],
                      padding: 7.0  ,
                      activeToggleColor: Colors.orange[800],
                      inactiveToggleColor: Colors.orange,
                      onToggle: (val) {
                        setState(() {
                          buttonsState[item] = val ;
                          if (val) {
                            ref.child('output').child('state-$item').set(true).asStream();
                          } else {
                            ref.child('output').child('state-$item').set(false).asStream();
                          }
                        });
                      },
                      activeSwitchBorder: Border.all(color: Colors.red ,width: 6.0 ),
                      //activeSwitchBorder: Border.all(color: Colors.red.withOpacity(200.0) ,width: 6.0 ),
                      inactiveSwitchBorder: Border.all(color: const Color(0xFFE7A261) , width: 6.0),
                      activeIcon: const Icon(Icons.lightbulb ,color: Color(0xFFFBC513),),
                      inactiveIcon: const Icon(Icons.lightbulb ,color: Color(0xFF908865),),
                      inactiveColor:Colors.white,
                      activeColor: Color(0xFFC8A989),



                    ),
                  );}),

            )
          ),
        ),
      ),

      // TextButton(onPressed: () {} ,
      //     child: Text('MgView')),
    );
  }
}


// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
// SizedBox(height: 15,),
//
// FlutterSwitch(
// width: 150.0,
// height: 70.0,
// toggleSize: 50.0,
// borderRadius: 30.0,
// value: status9,
// padding: 7.0  ,
// activeToggleColor: Colors.orange[800],
// inactiveToggleColor: Colors.orange,
// onToggle: (value) {
// setState(() {
// status9 = value ;
// if (value) {
// ref.child('output').child('state').set('on').asStream();
// } else {
// ref.child('output').child('state').set('off').asStream();
// }
// });
// },
// activeSwitchBorder: Border.all(color: Colors.red ,width: 6.0 ),
// //activeSwitchBorder: Border.all(color: Colors.red.withOpacity(200.0) ,width: 6.0 ),
// inactiveSwitchBorder: Border.all(color: const Color(0xFFE7A261) , width: 6.0),
// activeIcon: const Icon(Icons.lightbulb ,color: Color(0xFFFBC513),),
// inactiveIcon: const Icon(Icons.lightbulb ,color: Color(0xFF908865),),
// inactiveColor:Colors.white,
// activeColor: Color(0xFFC8A989),
//
//
//
// ),
//
// SizedBox(height: 15,),
//
// FlutterSwitch(
// width: 150.0,
// height: 70.0,
// toggleSize: 50.0,
// borderRadius: 30.0,
// value: status11,
// padding: 7.0  ,
// activeToggleColor: Colors.orange[800],
// inactiveToggleColor: Colors.orange,
// onToggle: (val) {
// setState(() {
// status11 = val ;
// if (val) {
// ref.child('output').child('state').set('on').asStream();
// } else {
// ref.child('output').child('state').set('off').asStream();
// }
// });
// },
// activeSwitchBorder: Border.all(color: Colors.red ,width: 6.0 ),
// //activeSwitchBorder: Border.all(color: Colors.red.withOpacity(200.0) ,width: 6.0 ),
// inactiveSwitchBorder: Border.all(color: const Color(0xFFE7A261) , width: 6.0),
// activeIcon: const Icon(Icons.lightbulb ,color: Color(0xFFFBC513),),
// inactiveIcon: const Icon(Icons.lightbulb ,color: Color(0xFF908865),),
// inactiveColor:Colors.white,
// activeColor: Color(0xFFC8A989),
//
//
//
// ),
//
// SizedBox(height: 15,),
//
// FlutterSwitch(
// width: 150.0,
// height: 70.0,
// toggleSize: 50.0,
// borderRadius: 30.0,
// value: status12,
// padding: 7.0  ,
// activeToggleColor: Colors.orange[800],
// inactiveToggleColor: Colors.orange,
// onToggle: (val) {
// setState(() {
// status12 = val ;
// if (val) {
// ref.child('output').child('state').set('on').asStream();
// } else {
// ref.child('output').child('state').set('off').asStream();
// }
// });
// },
// activeSwitchBorder: Border.all(color: Colors.red ,width: 6.0 ),
// //activeSwitchBorder: Border.all(color: Colors.red.withOpacity(200.0) ,width: 6.0 ),
// inactiveSwitchBorder: Border.all(color: const Color(0xFFE7A261) , width: 6.0),
// activeIcon: const Icon(Icons.lightbulb ,color: Color(0xFFFBC513),),
// inactiveIcon: const Icon(Icons.lightbulb ,color: Color(0xFF908865),),
// inactiveColor:Colors.white,
// activeColor: Color(0xFFC8A989),
//
//
//
// ),
//
// ],
// ),


// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class RoomControl extends StatefulWidget {
//
//   // late String app;
//   //
//   // RoomControl(String a, this.a) {
//   //
//   //   this.app = a ;
//   // }
//
//   // RoomControl()  ;
//
//   // final FirebaseApp app ;
//   // late String? app;
//   // RoomControl({this.app});
//   // late FirebaseApp firebaseApp ;
//
//   @override
//   State<RoomControl> createState() => _RoomControlState();
//
// }
//
// class _RoomControlState extends State<RoomControl> {
//
//   final referenceDatabase = FirebaseDatabase.instance ;
//
//   List buttonsState = List.generate(4, (index) => false);
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     initialButtons();
//     super.initState();
//   }
//
//   initialButtons(){
//
//     referenceDatabase.ref().child('output').get().then((value) {
//
//
//       for(int i = 0 ; i < 4 ; i++){
//         buttonsState[i] = value.child('state-$i').value;
//       }
//
//       setState(() {
//
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final ref = referenceDatabase.ref() ;
//     //final ref = referenceDatabase.ref() ;
//
//     return Scaffold(
//       backgroundColor: Colors.grey[700],
//       appBar: AppBar(
//         backgroundColor: Colors.orange[300],
//         title: Text('Control Room' , style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         actions: [
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.keyboard_control_outlined , color: Colors.black,),
//           )
//         ],
//       ),
//       // body: FutureBuilder(future: Firebase.initializeApp() ,
//       // builder: (context,snapshot)
//       // {
//       //
//       //   if (snapshot.hasError){
//       //     return Center(child: Container(color: Colors.red, child: Text('Errore'),));
//       //   }
//       //   if (snapshot.connectionState == ConnectionState.done) {
//       //     return Center(
//       //       child: Container(
//       //         color: Colors.green,child: Text('Connected'),
//       //       ),
//       //     );}
//       //
//       //     return Center(child: Container(color: Colors.grey)) ;
//       //
//       body:  SingleChildScrollView(
//
//         child: Center(
//           child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height - 50,
//                 child: ListView.builder(
//                     itemCount: 4,
//                     itemBuilder: (context , item){return  Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child: FlutterSwitch(
//                         width: 150.0,
//                         height: 70.0,
//                         toggleSize: 50.0,
//                         borderRadius: 30.0,
//                         value: buttonsState[item],
//                         padding: 7.0  ,
//                         activeToggleColor: Colors.orange[800],
//                         inactiveToggleColor: Colors.orange,
//                         onToggle: (val) {
//                           setState(() {
//                             buttonsState[item] = val ;
//                             if (val) {
//                               ref.child('output').child('state-$item').set(true).asStream();
//                             } else {
//                               ref.child('output').child('state-$item').set(false).asStream();
//                             }
//                           });
//                         },
//                         activeSwitchBorder: Border.all(color: Colors.red ,width: 6.0 ),
//                         //activeSwitchBorder: Border.all(color: Colors.red.withOpacity(200.0) ,width: 6.0 ),
//                         inactiveSwitchBorder: Border.all(color: const Color(0xFFE7A261) , width: 6.0),
//                         activeIcon: const Icon(Icons.lightbulb ,color: Color(0xFFFBC513),),
//                         inactiveIcon: const Icon(Icons.lightbulb ,color: Color(0xFF908865),),
//                         inactiveColor:Colors.white,
//                         activeColor: Color(0xFFC8A989),
//
//
//
//                       ),
//                     );}),
//               )
//           ),
//         ),
//       ),
//
//
//     );
//
//
//   }
// }