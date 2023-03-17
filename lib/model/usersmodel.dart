
class UsersModel {
  String? id ;
  String? name ;
  String? email ;
  String? phone ;

  UsersModel({this.id , this.name , this.email , this.phone}) ;

  UsersModel.fromMap(Map<String,dynamic>json){
    email=json['email'];
    phone=json['phone'];
    id=json['id'];
    name=json['name'];

  }

/*
  factory  UsersModel.fromMap(Map<String, dynamic> json) => UsersModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone:json["phone"] == null ? null : json["phone"],

  );

 */


  Map<String,dynamic> toJson() => {
    'id' : id,
    'name' : name ,
  'email' : email ,
    'phone' : phone ,
  };

}
