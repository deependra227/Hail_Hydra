import 'package:flutter/material.dart';

class Menu {
  String title;
  String image;
  Color menuColor;
  String site;
  int id;
  Menu(

      {this.id,
        this.title,
        this.image,
        this.site,
        this.menuColor = Colors.black});
}
