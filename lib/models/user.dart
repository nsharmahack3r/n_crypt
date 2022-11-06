import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.jwt, 
      this.id, 
      this.email,});

  User.fromJson(dynamic json) {
    jwt = json['jwt'];
    id = json['_id'];
    email = json['email'];
  }
  String? jwt;
  String? id;
  String? email;
User copyWith({  String? jwt,
  String? id,
  String? email,
}) => User(  jwt: jwt ?? this.jwt,
  id: id ?? this.id,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jwt'] = jwt;
    map['_id'] = id;
    map['email'] = email;
    return map;
  }

}