import 'package:flutter/material.dart';
import 'package:newsapp/Screens/NewsView.dart';
import 'package:newsapp/Screens/WeatherHomeScreen.dart';
import 'package:newsapp/widgets/homeScreen.dart';
import './widgets/NewsTile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:newsapp/Screens/NewsView.dart';
import 'package:newsapp/widgets/NewsTile.dart';




void main() => runApp(newsApp());
class newsApp extends StatelessWidget {
  
  // List NewsList;
  AppBar myAppBar = AppBar(
    backgroundColor: Colors.purple,
    title: Title(
      color: Colors.black,
      child:Text("Updates Live"),
    ),
    bottom: TabBar(tabs: [
      Tab(text: "News",),
      Tab(text: "Weather",),
    ]),
  );

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: DefaultTabController(
        
        length: 2,
        child: Scaffold(appBar: myAppBar,body: TabBarView(children: [
          homeScreen(),
          WeatherHomePage(),
        ]),),
      ),
      // routes: {
      // //  NewsView.routeName :(context) => NewsView(), 
      // },
    );
  }
}