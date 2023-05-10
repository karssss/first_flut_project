import 'package:first_flut_project/utilities/forecast_util.dart';
import 'package:flutter/material.dart';
import 'package:first_flut_project/pages/weather_forecast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot.data!.list;
    var pressure = forecastList!.first.pressure! * 0.750062;
    var humidity = forecastList!.first.humidity!;
    var wind = forecastList!.first.speed!;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Util.getItem(FaIcon(FontAwesomeIcons.temperatureThreeQuarters), pressure.round(), 'mm Hg'),
          Util.getItem(FaIcon(FontAwesomeIcons.cloudRain), humidity, '%'),
          Util.getItem(FaIcon(FontAwesomeIcons.wind), wind.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
