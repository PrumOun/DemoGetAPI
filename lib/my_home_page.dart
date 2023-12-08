import 'package:flutter/material.dart';
import 'package:my_app/Model/User.dart';
import 'services/user_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rest Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.fullName),
                    subtitle: Text(user.email),
              );
            }
        ),
      )
    );
  }

  Future<void> getUser() async{
    final response = await UserApi.fetchUser();
    setState(() {
        users = response;
    });
  }

}
