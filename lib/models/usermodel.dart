import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? phoneNo;
  String? name;
  String? lastName;
  String? email;
  String? password;

  UserModel({
    this.phoneNo,
    this.name,
    this.lastName,
    this.email,
    this.password,
  });

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNo': phoneNo,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNo: map['phoneNo'],
      name: map['name'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }
}
