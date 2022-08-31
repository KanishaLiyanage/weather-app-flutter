import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  var weatherCondition;

  AlertBox({
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    String condition = " ";

    if (weatherCondition == "Dark Clouds") {
      print(weatherCondition +
          " - It\'s better to take an umbrella, cover from rain.");
      condition = "It\'s better to take an umbrella, cover from rain.";
    }

    return Container(
      height: 70.0,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            condition,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
