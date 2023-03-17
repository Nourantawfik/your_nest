import 'package:flutter/material.dart';
import 'package:your_nest/model/usersmodel.dart';
import 'package:your_nest/pages/apiprovider.dart';




class ReadUser extends StatefulWidget {
  @override
  State<ReadUser> createState() => _ReadUserState();
}
class _ReadUserState extends State<ReadUser> {
  UsersModel? usersModel ;
  getUser() async{
    usersModel = await ApiProvider.readUsers() ;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: IconButton(onPressed: () {}  ,
        icon: Icon(Icons.add),),
    );
  }
}
