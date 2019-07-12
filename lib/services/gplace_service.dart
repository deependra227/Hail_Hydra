import 'package:http/http.dart' as http;
import '../models/place_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';


class LocationService {
  static final _locationService = new LocationService();
  var currentLocation ;
  static LocationService get() {
    return _locationService;
  }
  

    // Geolocator().getCurrentPosition().then((currloc){
    //   // setState((){
    //     print(currentLocation);
    //     currentLocation = currloc;
    //   // }); 
    // }); 
  
  
  // final String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+currentLocation.latitude.toString()+","+currentLocation.longitude.toString()"&radius=1500&type=hospital&key=AIzaSyBZQuvkA_RpMdH-4ExYdeQvc79Y3UMMA2Q";

// "+currentLocation.latitude.toString()+","+currentLocation.longitude.toString()+"

  Future<List<PlaceDetail>> getNearbyPlaces() async {
    var reponse = await http.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=26.512472,80.234034&radius=1500&type=hospital&key=AIzaSyANLtOOKe4piwIKqT6ofP8Szi67YSRI2qM"
, headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    var count = 0;
    data.forEach((f){
      // var st = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+f["photos"]["photo_reference"]+"&key=AIzaSyANLtOOKe4piwIKqT6ofP8Szi67YSRI2qM";
      // print(st);
      places.add(new PlaceDetail(f["place_id"], f["name"], f["icon"], f["rating"].toString(), f["vicinity"]));
    });
    print(count);
    print("Length of places here inside " + places.length.toString());
    return places;
  }
}
