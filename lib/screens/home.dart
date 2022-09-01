import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/refreshBtn.dart';
import '../widgets/weatherCard.dart';
import '../widgets/alertBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = "Colombo";
  String day = "Today";
  String time = "Noon";
  String temp = "32";
  String condition = "Mostly Sunny";

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
                day: day,
                time: time,
                temp: temp,
                condition: condition,
              ),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return AlertBox(
                      weatherCondition: condition,
                    );
                  },
                  itemCount: 6,
                ),
              ),
              RefreshButton(),
            ],
          ),
        ),
      ),
    );
  }
}
