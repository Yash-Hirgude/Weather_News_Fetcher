import 'package:flutter/material.dart';
import 'package:newsapp/Screens/NewsView.dart';

class NewsTile extends StatelessWidget {
  final title;
  final imgurl;
  final description;
  NewsTile(this.title, this.imgurl,this.description);
  void toggler(context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewsView(imgurl,title,description);
    }));
    // Navigator.of(context).pushNamed(NewsView.routeName,arguments: {"imgUrl" : imgurl,"title":title,"description":description});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        //     decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black,width: 0.5)
        // ),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 600,
                width: 200,
                child: Container(
                  // width: MediaQuery.of(context).size.width / 3,
                  // height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.fill) ),
                ),
              ),
              title: Text(
                title == null ? "NuLL" : title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 0.5,
              child: Container(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      onTap:() {toggler(context);},
    );
  }
}
