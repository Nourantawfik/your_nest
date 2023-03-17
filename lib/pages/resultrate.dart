//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'bottonnavbar.dart';


class ResultRate extends StatefulWidget {
  @override
  State<ResultRate> createState() => _ResultRateState();
}

class _ResultRateState extends State<ResultRate>
  with SingleTickerProviderStateMixin {


  late AnimationController controller ;
  @override
  void initState() {
  // TODO: implement initState
  super.initState();

  controller = AnimationController(duration: Duration(seconds: 3), vsync: this ,);
  controller.addStatusListener((status) async{

    if (status == AnimationStatus.completed) {

      Navigator.pop(context);
      controller.reset();

    }
  });

  }
  @override
  void dispose () {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.grey[500],
  appBar: AppBar(
  backgroundColor: Colors.grey[500],
  ),
  body: Center(
  child: SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,

  children: [
  Lottie.asset('assets/img/right.json',),
  SizedBox(height: 10,),

  Container(color: Colors.blue.withOpacity(0.50),
    child: ElevatedButton.icon(

    style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontWeight: FontWeight.bold),

    padding: EdgeInsets.symmetric(
    horizontal: 10.0 ,
    //textStyle: TextStyle(fontWeight: FontWeight.bold),
    )
    ),


    onPressed:showDoneDialog, icon:Icon(Icons.done_outline), label: Text(' You\'re Done')),
  ) ,
  SizedBox(height: 10,),


  Container(
  width: 250, height: 200,

  child: Image.asset('assets/img/qrcode.png')),
  SizedBox(height: 25,),

  Container(
  width: 250, height: 50,
  child: TextFormField(
  decoration: InputDecoration(
  label: Text('What\'s in your mind'),
  labelStyle:
  TextStyle(color: Colors.black),
  hintText: 'Tell us more',
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  ),
  enabledBorder: OutlineInputBorder(
  borderSide:
  BorderSide(color: Colors.black),
  borderRadius: BorderRadius.circular(25),
  ),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
  borderRadius: BorderRadius.circular(25),
  ),

  ),
  ),
  ),
  Center(
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  TextButton(onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => BottonNavBar() ));

  }, child: Text('No thanks' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[900],),)),

  SizedBox(width: 50,),

  TextButton( onPressed: () {

  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => BottonNavBar() ));
  } ,child: Text("Done", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[900],),), )
  ],
  ),
  ),

  ],
  ),
  ),
  ),

  );

  }

  void showDoneDialog() => showDialog(
  barrierDismissible: false ,
  context: context,
  builder: (context) => Dialog(
  child:
  Column(
  mainAxisSize: MainAxisSize.min,
  children: [
  Lottie.asset('assets/img/home.json' ,repeat: false , controller: controller ,
  onLoaded: (composition){
    controller.forward();
  },

  ),
  Text('Enjoy your home' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24),),

  SizedBox(height: 16,),

  ],
  ),
  ),
  );

}
