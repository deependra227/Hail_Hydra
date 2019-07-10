import 'package:flutter/material.dart';
import 'sidebar.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

String blogtitle ="I Would Rather Have a Day but 15 Minutes Will Do";
String blogcontent ="Summer is officially here this week, along with memories of those summer vacations and visions of future quests into the wild.";
String bloggername="Tim";
String bloggerImg;




Widget title() => Container(
  padding: const EdgeInsets.all(0.0) ,
  child:Card(
    child:Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset('assets/blog.png',fit: BoxFit.cover,),
         Column(
          //  mainAxisAlignment: MainAxisAlignment.end,
          //  crossAxisAlignment: CrossAxisAlignment.,
           children: <Widget>[
             
           Text(blogtitle,
            style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          
    ),
    textAlign: TextAlign.center,
     )
  ],
)
      ], 
     )
     )
);



Widget blogtext() =>Container(
  padding: const EdgeInsets.only(left:30.0,right: 30.0) ,
  child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
       Text(blogcontent,
       style: TextStyle(fontSize: 16.0),)
  ],
)
);

Widget blogger()=> Column(
  children: <Widget>[
    CircleAvatar(
      // backgroundImage: NetworkImage(bloggerImg)  ,
      radius: 30.0,
    ),
    Text(bloggername)
  ],
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(context) ,
      appBar: AppBar(
        title: Text("Blog of the day"),
        backgroundColor: Colors.black,
      ),
      body:Column(
        children: <Widget>[
          title(),
          blogtext(),
          blogger(),

        ],
      )
    );
  }
}