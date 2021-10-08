import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test_dio/Model/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("get all"),
              onPressed: () {
                getAll();
              },
            ),
            ElevatedButton(
              child: Text("get one"),
              onPressed: (){
                getOne();
              },
            ),
            ElevatedButton(
              child: Text("delete user"),
              onPressed: () {
                delete();
              },
            ),
            ElevatedButton(
              child: Text("post user"),
              onPressed: () {
                post();
              },
            ),
            ElevatedButton(
              child: Text("edit user"),
              onPressed: () {
                put();
              },
            ),
          ],
        ),
      ),
    );
  }

  void getAll() async {
    try {
      var response = await Dio().get(
          'https://6141b00e357db50017b3dc0c.mockapi.io/users');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void getOne() async {
    try {
    var response = await Dio().get('https://6141b00e357db50017b3dc0c.mockapi.io/users/2');
    print(response);
    User user= User.fromJson(response.data);
    print(user.toJson());
    }
    catch (e) {
      print(e);
    }
  }
  void delete() async {
    try {
      var response = await Dio().delete('https://6141b00e357db50017b3dc0c.mockapi.io/users/1');
      print("thanh cong");
    }
    catch (e) {
      print(e);
    }
  }
  void post() async {
    try {
      var response = await Dio().post('https://6141b00e357db50017b3dc0c.mockapi.io/users',
          data: {"name":"aaaa","age":1});
      print("thanh cong");
    }
    catch (e) {
      print(e);
    }
  }
  void put() async {
    try {
      var response = await Dio().put('https://6141b00e357db50017b3dc0c.mockapi.io/users/45',
          data: {"name":"alo"});
      print("thanh cong");
    }
    catch (e) {
      print(e);
    }
  }
}
