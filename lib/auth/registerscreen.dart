import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_nest/const.dart';
import 'package:your_nest/model/usersmodel.dart';
import 'package:your_nest/pages/apiprovider.dart';
import '../pages/bottonnavbar.dart';
import 'loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var Emailcontroller = TextEditingController() ;
  var passwordcontroller = TextEditingController();
  var Namecontroller = TextEditingController() ;
  var confirmpassword = TextEditingController() ;
  var phonec = TextEditingController();

  bool symbole = true ;
  bool conf = true ;

  var formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createSharedPreferences();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
 actions: [
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Icon(Icons.add_home_work , color: Colors.black,),
   ),

  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(Icons.smart_button,color: Colors.black,),
  )],

       leading: IconButton( onPressed: () {
          Navigator.pop(context) ;
        } , icon: Icon(Icons.arrow_back_outlined ,color: Colors.black,), ),
      ),

      body: Form(
        key: formKey ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child : Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.orange[300] ,
                        //color:Color(0xffa35c6c),


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('HERE YOU CAN SIGN UP', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ,color: Colors.black)),
                            Text('Sign up for free and enjoy it :)' , style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: Namecontroller,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Name must not be Empty';
                          }
                          else if (value.length<=5) {
                            return 'Name is too short' ;
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
                          labelText: 'Name',
                          labelStyle:
                          TextStyle(color: Colors.orange[500]),
                          hintText: 'Enter Your Full Name' ,
                          hintStyle: TextStyle(color: Colors.orange[500]),
                          suffix: Icon(Icons.perm_identity ,color: Colors.orange[300],) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,) ,

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: Emailcontroller,
                        validator: (value){
                          if (value!.isEmpty){
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
                          hintText: 'Enter Your Email' ,
                          hintStyle: TextStyle(color: Colors.orange[500]),
                          suffix: Icon(Icons.email ,color: Colors.orange[300],) ,

                        ),
                      ),
                    ),
                   // SizedBox(height: 25,) ,

                    SizedBox(height:10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phonec ,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'phone must not be empty' ;
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

                          labelText: 'phone' ,
                          labelStyle:
                          TextStyle(color: Colors.orange[500]),
                          hintText: 'Enter your phone number' ,
                          hintStyle: TextStyle(color: Colors.orange[500]),
                          suffix: Icon(Icons.phone_android) ,
                        ),
                      ),
                    ),

                    SizedBox(height:10),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordcontroller,
                        obscureText: symbole,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Password must not be empty';
                          }
                          else if
                          (value.length<=6) {
                            return 'password  too short';
                          }

                        } ,
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
                          labelText: 'Password',
                          labelStyle:
                          TextStyle(color: Colors.orange[500]),
                          hintText: 'Enter Your Password' ,
                          hintStyle: TextStyle(color: Colors.orange[500]),
                          suffixIcon:IconButton(onPressed: () {
                            setState((){}) ;
                            symbole =!symbole ;
                          } ,
                              icon: symbole?   Icon(Icons.visibility_off ,color: Colors.orange[300],) :
                              Icon(Icons.visibility ,color: Colors.orange[300],)),
                        ),
                      ),
                    ),
                    SizedBox(height:10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmpassword ,
                        obscureText: conf ,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'confirm must not empty' ;
                          }
                          else if (value.length<6){
                            return 'password is too short' ;
                          }
                          else if ( value != passwordcontroller.text) {
                            return 'password is not Match';
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
                            borderRadius: BorderRadius.circular(25),),



                          labelText: 'password' ,
                          labelStyle:
                          TextStyle(color: Colors.orange[500]),
                          hintText: 'Confirm your password' ,
                          hintStyle: TextStyle(color: Colors.orange[500]),
                          suffix: IconButton(onPressed: () {
                            setState(() {
                              conf =!conf ;
                            });
                          } ,
                              icon : conf?  Icon(Icons.visibility_off  , color: Colors.orange[300],):
                              Icon(Icons.visibility , color: Colors.orange[300],))  ,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.orange[300]),

              child: MaterialButton(onPressed: () async {
                        if(formKey.currentState!.validate()) {
                          final String name =Namecontroller.text ;
                          final String email =Emailcontroller.text ;
                          final String phone =phonec.text ;
                          
                          FirebaseAuth.instance.createUserWithEmailAndPassword(email:Emailcontroller.text, password:passwordcontroller.text).then((value) {
                            final user = UsersModel(
                              id : value.user!.uid,
                              name : name ,
                              email :email ,
                              phone : phone ,
                            );
                            uId = value.user!.uid;
                            //حطلى المعلومات دى هناك
                             FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(user.toJson()).then((value) {
                               ApiProvider.readUsers();
                             }).catchError((error){
                               print('The Error Is $error');
                             });
                          }).catchError((error){});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNavBar() ) );
                        }
                      },
                        child: Text('Register' ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold ,color: Colors.black),),),

                    ) ,
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Have an account?',style: TextStyle(color: Colors.black38),) ,
                          SizedBox(width: 15,) ,
                          TextButton(onPressed: () {
                           // if(formKey.currentState!.validate()) {}

                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
                            }
                           , child: Text('LogIn',style: TextStyle(color: Colors.orange[300] ,),), ) ,
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
  //
  // createSharedPreferences() async{
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('Name', Namecontroller.text) ;
  //   prefs.setString("Email", Emailcontroller.text) ;
  //   prefs.setString("Phones", phonec.text);
  //
  //   String? name = prefs.getString("Name");
  //
  //     String?   email = prefs.getString("Email");
  //
  //   String? phone = prefs.getString("Phones");
  //
  //   print(name);
  //   print(email);
  //   print(phone);
  //
  // }
}
