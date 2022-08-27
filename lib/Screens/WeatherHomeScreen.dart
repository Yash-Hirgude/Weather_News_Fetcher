import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'WeatherScreenView.dart';
import 'package:newsapp/models/weatherInfo.dart';


class WeatherHomePage extends StatefulWidget {
  
  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String city = "Pune";
  void infoUpdater(String newCity){
    setState(() {
      city = newCity;
    });
  }
  
  Future getData() async {
  String urlnew =
      "https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=1a298476d2699a3975e8a92e0d83dc41";
  // const String urlold =
  //     "http://api.weatherstack.com/current?access_key=fb1ce1dcb85a6126ecd2a7c086c2ca57&query=New%20York";
  final apiUrl = urlnew;

  http.Response response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Weather Exception");
  }
}
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
          var myData = json.decode((snapshot.data!).toString());
          weatherInfo weather = weatherInfo(
              myData["name"],
              myData["main"]["humidity"].toString(),
              (myData["main"]["temp"] - 273.15).toStringAsFixed(2),
              myData["wind"]["speed"].toString());
          return WeatherScreenView(weather,infoUpdater);
        } else  {
          if(snapshot.data == null){
            return Center(child: Text("Please enter correct location"),);
          }else{
          return Center(child: CircularProgressIndicator());
          }
        }
      }),
    );
  }
}
