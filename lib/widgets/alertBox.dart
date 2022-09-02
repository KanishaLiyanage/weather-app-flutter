import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final String weatherCondition;

  const AlertBox({
    Key? key,
    required this.weatherCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String condition = "";

    if (weatherCondition == "Mostly Sunny") {
      condition = "It's better to take a sunbath.";
    } else if (weatherCondition == "broken clouds") {
      condition = "Clouds with gaps that you can see blue sky between.";
    } else if (weatherCondition == "few clouds") {
      condition = "Sunny weather but okay.";
    } else if (weatherCondition == "scattered clouds") {
      condition = "Good climate to go outside & take a walk.";
    } else if (weatherCondition == "shower rain") {
      condition = "A short period of rain, but It's good to take an Umbrella.";
    } else if (weatherCondition == "rain") {
      condition = "Take an Umbrella if you are willing to outside.";
    } else if (weatherCondition == "thunderstorm") {
      condition = "Thnderstorms!. Be carefull to go outside.";
    } else if (weatherCondition == "snow") {
      condition = "It's snowy!. Wear several layers warm clothing.";
    } else if (weatherCondition == "mist") {
      condition = "It's better to wear a rain coat.";
    }

    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            condition,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // child: ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return AlertBox(
      //       weatherCondition: condition,
      //     );
      //   },
      //   itemCount: 6,
      // ),
    );
  }
}
