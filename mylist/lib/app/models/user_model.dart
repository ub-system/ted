import 'dart:convert';

class UserModel {
  int? id;
  String name;
  String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      // password: map['password'],
      // isAdmin: map['isAdmin'],
      // createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt']) : null,
      // token: map['token'],
    );
  }

  static List<UserModel> fromList(list) {
    return List<UserModel>.from(list.map((x) => UserModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
