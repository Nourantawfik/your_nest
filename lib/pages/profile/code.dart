import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_nest/pages/profile/settingpage.dart';

import '../../auth/registerscreen.dart';


class Code extends StatefulWidget {
  //const Code({Key? key}) : super(key: key);

  @override
  State<Code> createState() => _CodeState();
 
}

class _CodeState extends State<Code> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createSharedPreference();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        leading:IconButton(onPressed: () {
          Navigator.pop(context );
        }, icon:Icon(Icons.arrow_back_ios , color: Colors.black,),)

      ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,width: double.infinity,
            decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(children: [
                Icon(Icons.warning , color: Colors.red,size: 35,), SizedBox(height: 10,),
                Text("A're You Sure you Want to Delete this Account ?" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),) ,
                SizedBox(height: 25,),
                Row(children: [
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                  }, child: Text('yes' ,style: TextStyle(fontSize: 23 ,color: Colors.black),),) ,
                  SizedBox(width: 190,),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
                  }, child: Text('No' , style: TextStyle(fontSize: 22 , color: Colors.black),),),

                ],),
              ],),
            ),
          ),
        ),
      ),
    );
  }

  // createSharedPreferences() async{
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('Name',Namecontroller.text) ;
  //
  //   prefs.setString("Email", Emailcontroller.text) ;
  //
  //   prefs.setString("Phones", phonec.text);
  //
  //   String? name = prefs.getString("Name");
  //
  //   String?   email = prefs.getString("Email");
  //
  //   String? phone = prefs.getString("Phones");
  //
  //   print(name);
   // print(email);
    // print(phone);


  }

//}

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