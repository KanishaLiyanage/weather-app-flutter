import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/weatherCard.dart';
import '../widgets/alertBox.dart';

class HomeScreen extends StatefulWidget {
  String userName;
  String userEmail;

  HomeScreen({
    required this.userName,
    required this.userEmail,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState(userName, userEmail);
}

class _HomeScreenState extends State<HomeScreen> {
  String userName;
  String userEmail;

  _HomeScreenState(this.userName, this.userEmail);

  String city = "";
  String dayTime = "";
  String temp = "";
  String condition = "";

  final url = "https://weather-flutter-app-rest-api.herokuapp.com";

  Dio dio = Dio();

  Future<void> getData() async {
    try {
      var response = await dio.get('$url/user/home/weatherdata');
      print(response.data);
      if (response.statusCode == 200) {
        setState(() {
          city = response.data['city'];
          temp = response.data['temp'].toString();
          condition = response.data['desc'];
          dayTime = response.data['day'];
          // print(city);
          // print(temp);
          // print(condition);
          // print(dayTime);
        });
      }
    } catch (e) {
      print(e);
      print("There is an error in fetching data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherStatus(
              city: city,
              dayTime: dayTime.toLowerCase(),
              temp: temp,
              condition: condition,
            ),
            AlertBox(weatherCondition: condition),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Refresh"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
                onPrimary: Colors.white, // Text Color (Foreground color)
                elevation: 3,
                minimumSize: Size(120, 40),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 10, 20),
          color: Colors.red,
          child: Material(
            color: Colors.red,
            child: ListView(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNhcnRvb24lMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'),
                ),
                SizedBox(height: 30),
                Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userEmail,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: 280),
                ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
