
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'mainactivity.dart';


class addnote extends StatefulWidget {
  @override
  _addnoteState createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
   var k = rng.nextInt(10000);

    final ref = fb.ref().child('nodes/$k'); // /$k

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sensors"),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: second,
                  decoration: InputDecoration(
                    hintText: 'title',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: third,
                  decoration: InputDecoration(
                    hintText: 'sub title',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.indigo[900],
                onPressed: () {
                  ref.push();
                  ref.set({
                    "title": second.text,
                    "subtitle": third.text,}).asStream();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: Text(
                  "save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}