import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:your_nest/pages/animationroute.dart';
import 'package:your_nest/pages/resultrate.dart';

class RateUsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        leading: Icon(Icons.home , color: Colors.black,) ,
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.home , color: Colors.black,),
        ) ,],
        title: Text(' Lets Rate_Us 😊', style: TextStyle(
            color: Colors.orange[900],
            fontWeight: FontWeight.bold,
            fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.orange[300],
      ),
      body :
        Center(
          child: Container(
            width: double.infinity,
            child: SafeArea(
                child: Column  (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: Text('Tell us how was your experience...' , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold , color: Colors.black),),
                    ),

                    Text('Good!' , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold , color: Colors.black),) ,

                    SizedBox(height: 90,),


                    Center(
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                         Navigator.of(context).push(SliderRight(page: ResultRate())) ;
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => ResultRate(),),);

                          print(rating);
                        },
                      ),
                    ),

                  ],),
            ),
          ),
        ),

    );
  }
}

