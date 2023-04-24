import 'package:flutter/material.dart';
import 'package:first_flut_project/pages/weather_forecast.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot.data!.list;
    var icon = forecastList!.first.getIconUrl();
    var temp = forecastList!.first.temp?.day?.toStringAsFixed(0);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(icon, scale: 0.4, color: Colors.black87),
            SizedBox(width: 50.0),
            Column(
              children: <Widget>[
                Text(
                  '$temp C',
                  style: TextStyle(
                      fontSize: 54.0,
                      color:Colors.black87,
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }
}
