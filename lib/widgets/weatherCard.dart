import 'package:flutter/material.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({
    Key? key,
    required this.city,
    required this.day,
    required this.time,
    required this.temp,
    required this.condition,
  }) : super(key: key);

  final String city;
  final String day;
  final String time;
  final String temp;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            day,
            style: TextStyle(
                fontSize: 18.0, color: Colors.red, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                time,
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
