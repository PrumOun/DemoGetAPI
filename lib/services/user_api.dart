import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/Model/User.dart';
import 'package:my_app/Model/user_name.dart';
import '../constants/api_users.dart';


class UserApi{
    static Future<List<User>> fetchUser() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        nat: e['nat'],
        gender: e['gender'],
        phone: e['phone'],
        name: name,
      );
    }).toList();
    return users;
  }
}
