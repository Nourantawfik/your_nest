import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_nest/auth/registerscreen.dart';
import '../const.dart';
import '../pages/apiprovider.dart';
import '../pages/bottonnavbar.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var Email = TextEditingController();

  var password = TextEditingController();

  bool visible = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        //appBar: AppBar(
        //title: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [
        //Text('HERE YOU CAN LOG IN' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25 ,color:Colors.white,),),

        //Text(" Let's Join us :) " , style: TextStyle(color: Colors.white,),),
        //],),
        //backgroundColor: Color(0xff7D2252),
        //backgroundColor:Color(0xffa35c6c),
        // leading: IconButton( onPressed: () {
        // Navigator.pop(context) ;
        //} , icon: Icon(Icons.arrow_back_outlined), ),

        // ),
        // backgroundColor:Color(0xffecb02b),
        //backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xffe8c351),
                        //borderRadius: BorderRadius.only(

                        //bottomLeft: Radius.circular(25), ),
                      ),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'assets/img/smarthome.jpg',
                          height: 200,
                          width: double.infinity,
                        ),
                    ),
                    //SizedBox(height: 10,),
                    Container(
                      color: Colors.black54,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment .stretch,
                          children: [
                            Text(
                              'sign into',
                              style: TextStyle(color: Colors.black38),
                            ),
                            Text(
                              'Mange Your Device & Accessory',
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.black54,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              //color: Colors.black,
                              child: TextFormField(
                                style: TextStyle(color: Colors.orange[100]),
                                keyboardType: TextInputType.emailAddress,
                                controller: Email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email must not be Empty';
                                  }
                                },
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
                                    borderSide: BorderSide(color: Colors.orange[300]!),
                                    borderRadius: BorderRadius.circular(25),
                                  ),

                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Colors.orange[500]),
                                  hintText: 'Enter Your Email',
                                  hintStyle: TextStyle(color: Colors.orange[500]),
                                  suffix: Icon(
                                    Icons.email,
                                    color: Colors.orange[300],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.orange[100]),
                              keyboardType: TextInputType.visiblePassword,
                              controller: password,
                              obscureText: visible,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password must not be Empty';
                                } else if (value.length <= 6) {
                                  return 'password  too short';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  //borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange[300]!),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.orange[500]),
                                hintText: 'Enter Your Password',
                                hintStyle: TextStyle(color: Colors.orange[500]),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      visible = !visible;
                                    },
                                    icon: visible
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.orange[300],
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.orange[300],
                                          )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.orange[300]),
                            child: MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {

                                  FirebaseAuth.instance.signInWithEmailAndPassword(email:Email.text, password: password.text).then((value) {
                                    uId = value.user!.uid;
                                    ApiProvider.readUsers();
                                  }).catchError((error){

                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottonNavBar()));
                                }
                              },
                              child: Text(
                                'LogIn',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont have an account yet?',
                                  style: TextStyle(color: Colors.black38),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                TextButton(
                                    onPressed: () {
                                   //   if (formKey.currentState!.validate()) {}
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));

                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.orange[300],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
