import 'dart:convert';
import 'package:demo1/models/imed.dart';
import 'package:flutter/services.dart' show rootBundle;

class imedViewModel {
  static List<imed> imeds = new List<imed>();
  static imed selected = new imed(); 

  static Future load() async{ 
    List jsonParsed = json.decode(await getimeds());
    imeds = jsonParsed.map((i) => new imed.fromJson(i)).toList();
    selected = imeds[0];
  }

  static Future<String> getimeds() async {
    return await rootBundle.loadString('assets/imeds.json');
  }
}