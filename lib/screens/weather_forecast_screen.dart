import 'package:first_flut_project/api/weather_api.dart';
import 'package:first_flut_project/widgets/city_view.dart';
import 'package:first_flut_project/widgets/detail_view.dart';
import 'package:first_flut_project/widgets/temp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:first_flut_project/pages/weather_forecast.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  // Future<WeatherForecast>? forecastObject;
  // Future<WeatherForecast>? forecastObjectFunc;
  // late List<WeatherForecast> cityList;
  // String _cityName = 'London';
  forecastObjectFunc( String cityName){
    return WeatherApi().fetchWeatherForecastWithCity(cityName: cityName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // forecastObjectFunc( String cityName){
    //   return WeatherApi().fetchWeatherForecastWithCity(cityName: cityName);
    // }
    // forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    // forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: 'London');
  }

  @override
  Widget build(BuildContext context) {
    List<String> cityList = ["Los Angeles", "Ottawa", "Sydney", "Cape Town"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('openweathermap.org'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: cityList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              // return Text(cityList[index]);
              return Container(
                  child: FutureBuilder<WeatherForecast>(
                    // future: forecastObject,
                  future: forecastObjectFunc(cityList[index]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          CityView(snapshot: snapshot),
                          SizedBox(
                            height: 50.0,
                          ),
                          // TempView(snapshot: snapshot),
                          // SizedBox(
                          //   height: 50.0,
                          // ),
                          // DetailView(snapshot: snapshot),
                        ],
                      );
                    } else {
                      return Center(
                        child: SpinKitThreeBounce(color: Colors.black87, size: 50.0),
                      );
                    }
                  })
              );
    })
    );
  }
}


// OLD
    // body: ListView(children: <Widget>[
    //   Container(
    //     child: FutureBuilder<WeatherForecast>(
    //       future: forecastObject,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return Column(
    //             children: <Widget>[
    //               SizedBox(
    //                 height: 50.0,
    //               ),
    //               CityView(snapshot: snapshot),
    //               SizedBox(
    //                 height: 50.0,
    //               ),
    //               TempView(snapshot: snapshot),
    //               SizedBox(
    //                 height: 50.0,
    //               ),
    //               DetailView(snapshot: snapshot),
    //             ],
    //           );
    //         } else {
    //           return Center(
    //             child: SpinKitThreeBounce(color: Colors.black87, size: 50.0),
    //           );
    //         }
    //         ;
    //       },
    //     ),
    //   )
    // ])
    // );

