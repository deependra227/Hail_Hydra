import 'package:flutter/material.dart';

class Menu {
  String title;
  String image;
  Color menuColor;
  String site;

  Menu(
      {this.title,
        this.image,
        this.site,
        this.menuColor = Colors.black});
}
