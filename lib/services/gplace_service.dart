import 'package:http/http.dart' as http;
import '../models/place_model.dart';
import 'dart:async';
import 'dart:convert';


class LocationService {
  static final _locationService = new LocationService();
  var currentLocation ;
  static LocationService get() {
    return _locationService;
  }
  Future<List<PlaceDetail>> getNearbyPlaces(String lat, String long) async {
    var reponse = await http.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${long}&radius=1500&type=hospital&key=API_Key"
                                  , headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    var count = 0;
    data.forEach((f){
      places.add(new PlaceDetail(f["name"], f["vicinity"]));
    });
    return places;
  }
}
