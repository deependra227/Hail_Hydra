import 'package:flutter/material.dart';
import 'common_scaffold.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorPage extends StatelessWidget {
  Size deviceSize;
  final DocumentSnapshot list;
  DoctorPage({this.list});

  // String timing="10am-5pm";
  // // String phone = "24356";
  // String /email ="doctor1@email.com";

  Widget profileHeader() => Container(
    height: deviceSize.height / 5,
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

  Widget contactDataCard(){ return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
    child:Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Contact:",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0) ),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new IconButton(
          icon: new Icon(Icons.call),
          onPressed: () => launch("tel://"+list.data['phone']),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(list.data['phone']),
                  SizedBox(height: 5.0),
                  Text(list.data['mail'])
                ],
              ),
            ))
      ],
    ),
      ],
    ),
  );
  }
  
  Widget timingCard(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child:Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                "Timing:  ",
                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              Text(list.data['timing'],style: TextStyle(fontSize: 18.0)),
            ],
          )
        ]
      ));
    }


  
  Widget addressCard(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child:Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text("Address:  ",
                           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                        ),
               Container (
                padding: const EdgeInsets.all(0.0),
                width: 250.0,
                child: new Column (
                  children: <Widget>[
                    
                        Text(list.data['address'],style: TextStyle(fontSize: 18.0)),],
                ),
              ),
              SizedBox(height: 10.0,)
            ],
          )
        ]
      ));
    }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  Widget googleCard() => Container(
    width: double.infinity,
    height: deviceSize.height / 2.5,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 2.0,
              child:GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(list.data['location'].latitude, list.data['location'].longitude),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
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
        timingCard(),
        contactDataCard(),
        addressCard(),
        googleCard(),
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