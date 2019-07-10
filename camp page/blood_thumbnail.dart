import 'package:flutter/material.dart';

class BloodGroupThumbnailWidget extends StatelessWidget{

  final String requirement;
  final String bloodGroup;

  const BloodGroupThumbnailWidget({Key key, this.requirement, this.bloodGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Stack(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Image.asset(
                'assets/image/imed.png'
              )
            ],
          )
        ),
      ],
    );
  }


}