import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //package get kro
import 'package:flutter_uikit/ui/page/home_page.dart';
import 'package:flutter_uikit/utils/translations.dart';
import 'package:flutter_uikit/utils/uidata.dart';



class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
      },
      );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
