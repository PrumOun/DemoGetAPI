import 'package:my_app/Model/user_name.dart';

class User{
  final gender;
  final email;
  final phone;
  final cell;
  final nat;
  UserName name;

  User({this.gender, this.email, this.phone, this.cell, this.nat, required this.name});

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}