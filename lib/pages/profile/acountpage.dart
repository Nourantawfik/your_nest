
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';


class AccountPage extends StatelessWidget{
  static const keylanguage ='Key_language' ;
  static const keyllocation ='Key_location' ;

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(title: 'Account Settings' ,
  subtitle: 'privacy , Security , Language' ,

    leading: CircleAvatar(backgroundColor:  Colors.green,
        child: IconButton(onPressed: (){}, icon:Icon (Icons.person,))),
    child: SettingsScreen(
    title: 'Account Settings',
      children: [
     //   buildLanguage(),
      //  buildLocation(),
        buildPrivacy(context),
        buildSecurity(context),
        buildaccountInfo(context),
      ],
    ),
  );


  buildPrivacy(BuildContext context) =>SimpleSettingsTile(title: 'Privacy',
  subtitle: '',
    leading:CircleAvatar(
        backgroundColor: Colors.blue,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.lock),)) ,

  );

  buildSecurity(BuildContext context) =>SimpleSettingsTile(title: 'Security',
    subtitle: '',
    leading:CircleAvatar(
        backgroundColor: Colors.red,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.security),)) ,

  );

  buildaccountInfo(BuildContext context) =>SimpleSettingsTile(title: 'Account Info',
    subtitle: '',
    leading:CircleAvatar(
        backgroundColor: Colors.purple,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.text_snippet),)) ,

  );
  buildLanguage() =>SimpleSettingsTile(title: 'Account Info',
    subtitle: '',
    leading:CircleAvatar(
        backgroundColor: Colors.purple,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.text_snippet),)) ,

  );
//   buildLocation() =>DropDownSettingsTile(
//     settingKey: 'KeyLanguage',
//     title: 'Language',
//     selected: 1,
//     values: <int , String>{
//       1: 'English',
//       2:'Spanich',
//       3:'Chiness',
//       4:'Hindi' ,
//     },
//     onChange: (language){
//       // Map values = <int , String>{
//       //   1: 'English',
//       //   2:'Spanich',
//       //   3:'Chiness',
//       //   4:'Hindi' ,
//       ('KeyLanguage: $language');
//       }
//     //    values!=language;
//     // }
//   );
//   buildLocaton() => TextInputSettingsTile(
// settingKey: 'KeyLocation',
//     title: 'Location',
//     initialValue: 'Egypt',
//     onChange: (location) {
//       ('KeyLanguage: $location');
//     },
//
//   );
}




















// class AccountPage extends StatelessWidget {
//   const AccountPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[800],
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   Text('General' ,style: TextStyle(fontSize: 25, color: Colors.white54) ,),
// SizedBox(height: 20,),
//                     GestureDetector( onTap: () {},
//                       child: Row(children: [
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.blueAccent,
//                               child: Icon(Icons.logout )),
//                         ) ,
//                         SizedBox(width: 20,) ,
//                         Text('LogOut',style: TextStyle(fontSize: 18, color: Colors.white) ,) ,
//                       ],),
//                     ),
//
//                     SizedBox(height: 10,),
//                     GestureDetector( onTap: () {},
//                       child: Row(children: [
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CircleAvatar(
//                               backgroundColor: Colors.pink,
//                               child: Icon(Icons.delete )),
//                         ) ,
//                         SizedBox(width: 20,) ,
//                         Text('Delete Account',style: TextStyle(fontSize: 18, color: Colors.white) ,) ,
//                       ],),
//                     ),
//                     Divider(height: 1, color: Colors.white54,),
//
//                     SizedBox(height: 15,),
//
//                     Text('FEEDBACK',style: TextStyle(fontSize: 18, color: Colors.white54) ,),
//                     SizedBox(height: 10,),
//
//                     GestureDetector( onTap: () {},
//                       child: Row(children: [
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CircleAvatar(
//                               backgroundColor: Colors.teal,
//                               child: Icon(Icons.bug_report)),
//                         ) ,
//                         Text('Clicked Report Bug' ,style: TextStyle(fontSize: 18, color: Colors.white) ,),]),),
//
//                         SizedBox(height: 10,),
//     GestureDetector( onTap: () {},
//     child: Row(children: [
//
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: CircleAvatar(
//     backgroundColor: Colors.purple,
//     child: Icon(Icons.thumb_up )),
//     ) ,
//     Text('Send FeedBack',style: TextStyle(fontSize: 18, color: Colors.white) ,)
//
//                 ],),
//               ),
//           ],
//         ),
//                     ),
//                     ],),
//       ),
//       ),
//     );
//   }
// }
