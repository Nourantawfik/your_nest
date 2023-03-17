import 'package:flutter/material.dart';

class SliderRight extends PageRouteBuilder{

  final page ;

  SliderRight({this.page}) : super(pageBuilder :(context , animation , animationtwo) => page ,
      transitionsBuilder:(context , animation , animationtwo , child)  {

    var begin = 0.0 ;
    var end = 1.0 ;
    var tween = Tween(begin: begin , end: end);
    var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.easeInBack) ;

    return ScaleTransition( scale: tween.animate(curvesanimation) , child : child ) ;



    //return FadeTransition(opacity: animation , child: child,);
      }
  ) ;
}