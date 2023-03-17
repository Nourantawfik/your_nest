import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:your_nest/pages/profile/acountpage.dart';
import 'package:your_nest/pages/apiprovider.dart';
import 'package:your_nest/pages/utils.dart';

import '../../auth/loginscreen.dart';
import 'code.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsPageState();
}
//
class SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
          leading:IconButton(onPressed: () {

            Navigator.pop(context)  ;

          }, icon:Icon(Icons.arrow_back_ios , color: Colors.black,),),
      ),
     // backgroundColor: Colors.grey[800],

      body:
      ListView(
      children: [
        Container(
          //  height:150,
      child: Column(
        children: [
          Image(image: AssetImage('assets/img/noimg.jpg') , height: 200,),
          SizedBox(height: 7,),

          Column(
            children: [
              Text('${ApiProvider.usersModel!.name}' , style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),

              Text('${ApiProvider.usersModel!.email}' , style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),

              Text('${ApiProvider.usersModel!.phone}' , style: TextStyle(fontSize: 20),),
            ],
          ),
        ],
      )),

        SettingsGroup(
          title: "General" ,

          children: [
            AccountPage(),
            buildLogOut(),
            buildDeleteAccount() ,
          ],
        ),
        SizedBox(height: 25,),
        SettingsGroup(title: 'FEEDBACK', children:[
          SizedBox(height: 10,),
          buildReportBug(context),

          buildSendFeedBack(context),],
        ),
      ],
      ),



    );
  }
  buildLogOut() =>SimpleSettingsTile(title: 'LogOut' , subtitle:  '',

  leading: CircleAvatar(
      backgroundColor: Colors.blueAccent,
      child: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
      },
          icon:Icon(Icons.logout,))),
   // onTap: () => Utils.showSnackBar(context , 'Clicked LogOut'),

  );

  buildDeleteAccount() => SimpleSettingsTile(title: 'Delete Account' , subtitle:'',
    leading: CircleAvatar(
      backgroundColor:Colors.pink,

        child: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Code() ,) );
        },
            icon: Icon(Icons.delete,))),
   // onTap: () => Utils.showSnackBar(context , 'Delete Account'),

  );

  buildReportBug(BuildContext context) =>SimpleSettingsTile(
    title: 'Report A Bug' ,
    subtitle: '',
    leading: CircleAvatar(
        backgroundColor: Colors.teal,

        child: IconButton(onPressed: (){},

            icon: Icon(Icons.bug_report))) ,
    //onTap: () =>Utils.showSnackBar(context , ' Clicked Report Bug'),
  );

  buildSendFeedBack(BuildContext context)  =>SimpleSettingsTile(
    title: 'Send FeedBack' ,
    subtitle: '',
    leading: CircleAvatar(
        backgroundColor: Colors.purple,

        child: IconButton(onPressed: () {},

            icon: Icon(Icons.thumb_up)),));

}
