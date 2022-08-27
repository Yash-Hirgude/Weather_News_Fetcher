import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:weather_icons/weather_icons.dart';

import 'package:newsapp/models/weatherInfo.dart';

class WeatherScreenView extends StatefulWidget {
  weatherInfo weather;
  Function infoUpdater;
  // String temp;
  WeatherScreenView(this.weather,this.infoUpdater);

  @override
  State<WeatherScreenView> createState() => _WeatherScreenViewState();
}

class _WeatherScreenViewState extends State<WeatherScreenView> {
  TextEditingController locationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/BackgroundImage.webp"),fit: BoxFit.fill)
      ),
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: locationTextController,
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: 'Enter Location Here',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 0,
              // ),
              ElevatedButton(onPressed: (){widget.infoUpdater(locationTextController.text);}, child: Text("Get Info")),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.wb_sunny,
                size: MediaQuery.of(context).size.height / 5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "City : " + widget.weather.city.toString(),
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Temp : " + widget.weather.temperature.toString() + "°C",
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Humidity : " + widget.weather.humidity.toString(),
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Wind Speed : " + widget.weather.windspeed.toString(),
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
              ),
            ],
          ),
        ));
  }
}
