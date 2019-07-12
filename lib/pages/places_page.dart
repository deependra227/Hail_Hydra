import 'package:demo1/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/place_model.dart';
import '../services/gplace_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class PlacesPage extends StatefulWidget {
  @override
  State createState() => new Placestate();
}

class Placestate extends State<PlacesPage> {
  String _currentPlaceId;

  @override
  Widget build(BuildContext context) {
    // onItemTapped= ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new PlaceDetailPage(_currentPlaceId)));
    return new Scaffold(
      drawer: sideBar(context),
        appBar: new AppBar(
        elevation: 10.0,
        title: new Text("Nearby hospitals",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.black),
      ),
      body:_createContent(),
      );
  }
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _createContent() {
    if(_places == null){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }

    else{
      return new ListView(    
         children: _places.map((f){
           return new Card(
              child : new Center(
                child : AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height :MediaQuery.of(context).size.height / 5.5,
                  width : MediaQuery.of(context).size.width,
                  child:Material(
                    child:InkWell(
                      splashColor: Colors.blue,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 2.0,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child:Image.asset('assets/hospital.png'),
                                ),
                                
                                Container(
                                  width:MediaQuery.of(context).size.width*0.50,
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width : MediaQuery.of(context).size.width*0.50,
                                        child : Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(f.name,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20.0,), textAlign: TextAlign.center,),
                                            Text(f.vicinity,  textAlign: TextAlign.center),
                                          ]
                                        ) ,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                           ),  
                         ],
                        ),
                       ),
                      ),
                    ),
                  ),
                ),
              
           )
            ;
         }).toList(),
      );
    }
  }
  var lat, long;
  List<PlaceDetail> _places;
  @override
  void initState() {
    super.initState();
    _fetchDoctorList();
  }


  Future _fetchDoctorList() async {
    var currentLocation = await Geolocator().getCurrentPosition();
    lat = currentLocation.latitude.toString();
    long = currentLocation.longitude.toString();
    if (_places == null) {
    LocationService.get().getNearbyPlaces(lat, long).then((data) {
      this.setState(() {
        _places = data;
        print("Length of Places in master" + _places.length.toString());
      });
     });
    }
  }
}