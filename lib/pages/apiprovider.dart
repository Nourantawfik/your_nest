import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_nest/const.dart';
import 'package:your_nest/model/usersmodel.dart';
class ApiProvider {
  static UsersModel? usersModel;
// عايوه من هناك المعلومات دى
  static Future<UsersModel?> readUsers() async {
    await FirebaseFirestore.instance.
    collection('users').
    doc(uId).get().then((value) {
      usersModel = UsersModel.fromMap(value.data()!);
      print(usersModel?.name);
      print(value.data());
      return usersModel;
    });
  }
}