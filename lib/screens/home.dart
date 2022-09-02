import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/weatherCard.dart';
import '../widgets/alertBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          print(city);
          print(temp);
          print(condition);
          print(dayTime);
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
          ),
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
      ),
    );
  }
}
