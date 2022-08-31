import 'package:flutter/material.dart';

import '../widgets/refreshBtn.dart';
import '../widgets/weatherCard.dart';
import '../widgets/alertBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String condition = "Dark Clouds";
  String city = "Colombo";
  String temp = "32";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherCard(condition: condition, city: city, temp: temp),
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
    );
  }
}
