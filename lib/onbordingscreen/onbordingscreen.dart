import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../auth/loginscreen.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body: IntroductionScreen(
        pages: [

          PageViewModel(
            image:Image.asset('assets/img/white1.jpeg',height: 240,),
            title: 'Smart Home App' ,
            body: 'You are few click to enter the world of smart home',
            decoration: getpageDecoration() ,

          ) ,
          PageViewModel(
            image: Image.asset('assets/img/white2.jpeg' ,height: 240,) ,
            title:'Set Up Device Easliy',
            body: 'Control them all using smart home app' ,
            decoration: getpageDecoration() ,
          ) ,
          PageViewModel(
            image: Image.asset('assets/img/white3.jpeg',) ,
            title: 'Get Notified' ,
            body: 'get notification for any activity or alert',
            decoration: getpageDecoration() ,
          ) ,
        ],
        next: Icon(Icons.arrow_forward_ios , color:Colors.orange[300],),
        done: Text('Done', style: TextStyle(color: Colors.orange[900],),) ,
        onDone:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) ,) ;
        } ,

        showSkipButton: true,
        skip: Text('Skip', style: TextStyle(color: Colors.orange[500],),),
        dotsDecorator: getDotDecorator(),
        onSkip:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) ,) ;
        } ,
      ) ,
    );
  }
  PageDecoration getpageDecoration(){
    return PageDecoration(
      titleTextStyle : TextStyle(fontSize: 25,color: Colors.orange[800], fontWeight: FontWeight.bold,) ,
      bodyTextStyle : TextStyle(fontSize: 18,color: Colors.orange[600],) ,
      imagePadding: EdgeInsets.all(20),
      //imageAlignment: Alignment.center,
      bodyAlignment: Alignment.center,
      bodyPadding: EdgeInsets.all(20) ,
      pageColor: Colors.white ,


    );
  }
  DotsDecorator getDotDecorator(){
    return DotsDecorator(
      color: Colors.orange,
      activeColor: Colors.orange[700],
    );
  }
}