import 'package:flutter/material.dart';
import 'common_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
class DoctorPage extends StatelessWidget {
  Size deviceSize;
  final DocumentSnapshot list;

  DoctorPage({this.list});

  // String name = "Saurabh";
  // String spec = "MBBS";
  String timing="10am-5pm";
  String phone = "24356";
  String email ="doctor1@email.com";

  Widget profileHeader() => Container(
    height: deviceSize.height / 4,
    width: double.infinity,
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(width: 2.0, color: Colors.white)),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/5/53/Wikipedia-logo-en-big.png'),
                ),
              ),
              Text(
                list.data['docName'],
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                list.data['Spec'],
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ),
  );
  Widget imagesCard() => Container(
    height: deviceSize.height / 6,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Timing",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          Expanded(
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(timing),

              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget profileColumn() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new IconButton(
          icon: new Icon(Icons.call),
          onPressed: () => launch("tel://21213123123"),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    phone,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    email,
                  )
                ],
              ),
            ))
      ],
    ),
  );

  Widget postCard() => Container(
    width: double.infinity,
    height: deviceSize.height / 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Contact",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          profileColumn(),
          Expanded(
            child: Card(
              elevation: 2.0,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810_960_720.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget bodyData() => SingleChildScrollView(
    child: Column(
      children: <Widget>[
        profileHeader(),
//        followColumn(deviceSize),
        imagesCard(),
        postCard(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "Profile",
      bodyData: bodyData(),
      elevation: 0.0,
    );
  }
}
