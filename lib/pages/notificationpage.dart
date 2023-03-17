
//
// import 'package:flutter/cupertino.dart';
//
// class Application extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _Application();
// }
//
// class _Application extends State<Application> {
//   // It is assumed that all messages contain a data field with the key 'type'
//   Future<void> setupInteractedMessage() async {
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//
//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//
//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }
//
//   void _handleMessage(RemoteMessage message) {
//     if (message.data['type'] == 'chat') {
//       Navigator.pushNamed(context, '/chat',
//         arguments: ChatArguments(message),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Run code required to handle interacted messages in an async function
//     // as initState() must not be async
//     setupInteractedMessage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("...");
//   }
// }
//
// import 'package:flutter/material.dart';
//
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
//
// class HomeScr extends StatefulWidget {
//   @override
//   HomeScrState createState() => HomeScrState();
// }
//
// class HomeScrState extends State<HomeScr> {
//   List<Item> items = [];
//   late Item item;
//   late DatabaseReference itemRef;
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     item = Item("", "");
//     final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.
//     itemRef = database.ref().child('items');
//     itemRef.onChildAdded.listen(_onEntryAdded);
//     itemRef.onChildChanged.listen(_onEntryChanged);
//   }
//
//   _onEntryAdded(event) {
//     setState(() {
//       items.add(Item.fromSnapshot(event.snapshot));
//     });
//   }
//
//   _onEntryChanged( event) {
//     var old = items.singleWhere((entry) {
//       return entry.key == event.snapshot.key;
//     });
//     setState(() {
//       items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
//     });
//   }
//
//   void handleSubmit() {
//     final FormState? form = formKey.currentState;
//
//     if (form!.validate()) {
//       form.save();
//       form.reset();
//       itemRef.push().set(item.toJson());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FB example'),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             flex: 0,
//             child: Center(
//               child: Form(
//                 key: formKey,
//                 child: Flex(
//                   direction: Axis.vertical,
//                   children: <Widget>[
//                     ListTile(
//                       leading: Icon(Icons.info),
//                       title: TextFormField(
//                         initialValue: "",
//                         onSaved: (val) => item.title = val!,
//                         validator: (val) => val == "" ? val : null,
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.info),
//                       title: TextFormField(
//                         initialValue: '',
//                         onSaved: (val) => item.body = val!,
//                         validator: (val) => val == "" ? val : null,
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.send),
//                       onPressed: () {
//                         handleSubmit();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             child: FirebaseAnimatedList(
//               query: itemRef,
//               itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                   Animation<double> animation, int index) {
//                 return new ListTile(
//                   leading: Icon(Icons.message),
//                   title: Text(items[index].title),
//                   subtitle: Text(items[index].body),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//  class Item {
//    String key;
//    String title;
//    String body;
//
//    Item(this.title, this.body);
//
//    Item.fromSnapshot(DataSnapshot snapshot)
//        : key = snapshot.key!,
//          title = snapshot.value["title"],
//          body = snapshot.value['body'].toString();
//
//   toJson() {
//     return {
//       "title": title,
//       "body": body,
//     };
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';

class RealTime extends StatelessWidget {
  //const RealTime({Key? key}) : super(key: key);


  final _form = GlobalKey<FormState>();
  late String title;

  get http => null;
  void writeData() async {
    _form.currentState!.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "DatabaseURL"+"data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksforGeeks"),
      ),
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Title"),
                onSaved: (value) {
                  title = value!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              
              MaterialButton(
                  onPressed: writeData,
                  color: Colors.green,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),),
            ],
          ),
        ),
      ),
    );
    
  }
}

