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
      child: Column(
          children: <Widget>[
            Text('$city, $country', style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color:Colors.black87
            ),
            ),
            Text(
              '${ Util.getFormattedDate(formattedDate)}',
               style:TextStyle(
                 fontSize: 15.0,
              ),
            ),
          ],
      ),
    );
  }
}
