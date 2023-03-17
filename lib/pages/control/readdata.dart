import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  //const ReadData({Key? key}) : super(key: key);
  final referenceData = FirebaseDatabase.instance;

  final sensors = 'Read Sensors' ;

  var sensorcontroller = TextEditingController();

  late DatabaseReference sensorRef ;

  @override
  void initState() {
    // TODO: implement initState

   // FirebaseDatabase database  FirebaseDatabase ;

    sensorRef = referenceData.ref().child('Sensors') ;
super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ref = referenceData.ref();

    return Scaffold(

     backgroundColor: Colors.grey[800],

      appBar: AppBar(
        backgroundColor: Colors.orange[300],
      ),

      body:  SingleChildScrollView(
        child: Column(

          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              color: Colors.orange[300],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Text(sensors , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[800]!),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'Type Data',
                            labelStyle: TextStyle(color: Colors.orange[900]),
                            hintText: 'Type Your Data',
                            hintStyle: TextStyle(color: Colors.orange[900]),
                          ),
                          controller: sensorcontroller,
                          textAlign:TextAlign.center ,
                        ),
                      ),
                      SizedBox(height: 15,),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.orange[900],
                        ),

                        child: MaterialButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                            onPressed: () {
                          ref.child('output').push().child(sensors).set(sensorcontroller.text,).asStream();


                        } , child: Text(' Set Sensors' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),),
                      ),
                      Flexible(

                        child: new FirebaseAnimatedList(query:sensorRef,
shrinkWrap: true,
                          itemBuilder: ( (context ,
                          DataSnapshot snapshot ,
                          Animation<double> animation , int index
                          )
                      {
                        return new ListTile(
                        trailing: IconButton(onPressed: (){
                          sensorRef.child(snapshot.toString()).remove() ;
                        }, icon: Icon(Icons.delete),
                        ),
                          title: new Text(snapshot.value.toString()),


                        );

                      }),),

                      ),
                      TextButton(onPressed: () {
                        ref.child('output').child(sensors).get().then((value) {}).asStream();
                      }, child: Text('get data'),),
                    ],
                  ),
                ),
              ),
            ),
        ],
    ),
      ),




    );
  }
}
