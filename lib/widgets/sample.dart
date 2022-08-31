import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio dio = new Dio();

  var email = "";
  var name = "";
  var users = [];

  var url = 'https://todo-flutter-app-rest-api.herokuapp.com';

  Future<void> getData() async {
    try {
      var myData = await dio.get('$url/users');
      setState(() {
        users = myData.data;
        print(users);
      });
      print("Hello world");
    } catch (e) {
      print(e);
      print("===");
    }
  }

  Future<void> postData() async {
    var userDetails = {
      "name": "Max",
      "email": "max@sa.com",
      "password": "hfhhfk420!",
      "age": 30
    };

    try {
      var postData = await dio.post('$url/users', data: userDetails);
      setState(() {
        print(postData);
      });
    } catch (e) {
      print(e);
      print("===");
    }
  }

  Future<void> patchData() async {
    var userDetails = {"name": "Angela"};

    try {
      var patchData = await dio.patch('$url/users/62f8ca4100a699128c68574a',
          data: userDetails);
      setState(() {
        print(patchData);
      });
    } catch (e) {
      print(e);
      print("===");
    }
  }

  Future<void> deleteData() async {
    try {
      var deleteData = await dio.delete('$url/users/62f8ca4100a699128c68574a');
      setState(() {
        print(deleteData);
      });
    } catch (e) {
      print(e);
      print("===");
    }
  }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(users[index]["name"]);
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: const Icon(Icons.add),
      ),
    );
  }
}
