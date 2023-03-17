import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';
import 'package:your_nest/pages/control/readdata.dart';
import 'package:your_nest/pages/notificationpage.dart';
import 'package:your_nest/pages/profile/acountpage.dart';
import 'package:your_nest/pages/bottonnavbar.dart';
import 'package:your_nest/pages/profile/code.dart';
import 'package:your_nest/pages/control/mainactivity.dart';
import 'package:your_nest/pages/profile/myhouse.dart';
import 'package:your_nest/pages/profile/settingpage.dart';
import 'package:your_nest/pages/profilescreen.dart';
import 'package:your_nest/pages/control/roomcontrol.dart';
import 'package:your_nest/pages/utils.dart';
import 'package:your_nest/streambuilder/streambuilder.dart';
import 'package:your_nest/services/auth_service.dart';
//import 'package:your_nest/pages/roomcontrol.dart';
import 'package:your_nest/store/readusers.dart';
import 'auth/loginscreen.dart';
import 'auth/registerscreen.dart';
import 'const.dart';
import 'onbordingscreen/onbordingscreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';


 AndroidNotificationChannel channel = AndroidNotificationChannel('high_importance_channel' //id
    ,
'High Importance Notifications' //title or name
  ,
  // 'This channel is used for important notifications.',  //description
//,
  importance: Importance.high ,
  playSound: true ,);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future <void> firebaseMessagingBackGroundHandler (RemoteMessage message)  async{
  await Firebase.initializeApp() ;
  print('a bg message just showed up : ${message.messageId}') ;

}

 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized() ;
  //await  Settings.init(cacheProvider:SharePreferenceCache());
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackGroundHandler) ;

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.
      createNotificationChannel(channel) ;
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true ,
    badge: true ,
    sound: true ,
  );
  FirebaseFirestore.instance.collection('tokens').add({'token':await FirebaseMessaging.instance.getToken()});


    // (CacheProvider:SharePreferenceCache());
  // CacheProvider Settings = CacheProvider: SharePreferenceCache();
  // await Settings.init(Settings);

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(fire < 60) {

      showNotification();
    }
  }
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    home: //RealTime(),

    //ReadData(),
      //Home(),
    //Utils(),
   // SettingsPage(),
      //AccountPage(),
    //Code(),
        // ChangeNotifierProvider(
        //     create:(BuildContext context) => AuthService(),
        //     child: ProfileView()),


   // StreamScreean(),
   // RoomControl(),
       // OnboardingPage() ,
    //ReadUser(),
   // OnboardingPage() ,
   LoginScreen(),
   //BottonNavBar(),
    //MyHouse() ,
   // RegisterScreen()  ,

    );
  }
}
