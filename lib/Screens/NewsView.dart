import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsView extends StatelessWidget {
  static String routeName = "NewsViewRoute";
  late final imgUrl;
  late final title;
  late final description;

  NewsView(this.imgUrl, this.title, this.description);
  final FlutterTts myTTS = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future _reader() async {
      await myTTS.setPitch(1);
      await myTTS.setLanguage("en-IN");
      // await myTTS.setVoice();
      print(await myTTS.getVoices);

      // if(Platform.isAndroid){
      //   await myTTS.setVoice({"name": "en-us-x-tpf-local", "locale": "en-US"});
      // }else{
      await myTTS.setVoice({"name": "Alex", "locale": "en-US"});
      // }

      print(myTTS.getVoices);
      await myTTS.speak(description);
    }

    // final routArgs = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    // final ImageUrl = routArgs["imgUrl"].toString();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/NewsBackground.webp"),
                fit: BoxFit.fill),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.height / 2,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imgUrl == null
                            ? const NetworkImage(
                                "https://images.app.goo.gl/6kfNWPsBHanyZBvcA")
                            : NetworkImage(imgUrl),
                        fit: BoxFit.fill),
                    border: Border.all(color: Colors.black, width: 10),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 40,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reader,
        child: const Icon(Icons.volume_up),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
