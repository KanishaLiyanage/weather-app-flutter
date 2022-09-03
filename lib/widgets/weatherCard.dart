import 'package:flutter/material.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({
    Key? key,
    required this.city,
    required this.dayTime,
    required this.temp,
    required this.condition,
  }) : super(key: key);

  final String city;
  final String dayTime;
  final String temp;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            city,
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.red,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 25.0),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                dayTime,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                size: 74.0,
                color: Colors.red,
              ),
              SizedBox(width: 20.0),
              Column(
                children: <Widget>[
                  Text(
                    temp + "°C",
                    style: TextStyle(
                        fontSize: 54.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    condition,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
