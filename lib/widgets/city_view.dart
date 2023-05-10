import 'package:flutter/material.dart';
import 'package:first_flut_project/pages/weather_forecast.dart';
import 'package:first_flut_project/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList!.first.dt! * 1000);

    return Container(
        // alignment: Alignment.center,
      // child: Column(
      // children: <Widget>[
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                Text('$country', style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey
                ),
                ),
                Text('$city', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.black87
                ),
                ),
               ]
              )
          ),
          Text(
            '${ Util.getFormattedDate(formattedDate)}',
            style: TextStyle(
              fontSize: 15.0,
            ),
          )
        ]
      )
    );
  }
}
