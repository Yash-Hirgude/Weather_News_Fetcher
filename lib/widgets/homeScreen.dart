import 'package:flutter/material.dart';
import './NewsTile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:newsapp/Screens/NewsView.dart';
import 'package:newsapp/widgets/NewsTile.dart';

Future newsList() async {
  const apiUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=9d33fd1046f14e75afe271d607584a2c";
  http.Response response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Error in response");
  }
}

class homeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: newsList(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var NewData = json.decode((snapshot.data!).toString());
            return ListView.builder(
              itemCount: NewData == null ? 0 : NewData["articles"].length,
              itemBuilder: ((context, index) {
                return NewsTile(
                    NewData["articles"][index]["title"] == null
                        ? "Loading"
                        : NewData["articles"][index]["title"],
                    NewData["articles"][index]["urlToImage"] == null ? "https://images.app.goo.gl/AZ5acPAVHw9Fux44A" : NewData["articles"][index]["urlToImage"],
                    NewData["articles"][index]["description"] == null
                        ? "Data Not Available"
                        : NewData["articles"][index]["description"]);
              }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
    );
  }
}
