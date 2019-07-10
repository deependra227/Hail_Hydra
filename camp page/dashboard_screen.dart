
import 'package:blooddonation/recent_update_list_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double bannerHeight, listHeight, listPaddingTop;
  double cardContainerHeight, cardContainerTopPadding;

  @override
  Widget build(BuildContext context) {
    bannerHeight = MediaQuery.of(context).size.height * .25;
    listHeight = MediaQuery.of(context).size.height * .75;
    cardContainerHeight = 200;
    cardContainerTopPadding = bannerHeight / 2;
    listPaddingTop = cardContainerHeight - (bannerHeight / 2);
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              topBanner(context),
              Expanded(child: activecamplist(context))
            ],
          ),
          bannerContainer(),
          cardContainer(context),
        ],
      ),
    );
  }

  Container activecamplist(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      padding:
          new EdgeInsets.only(top: listPaddingTop, right: 10.0, left: 10.0),
      child: Column(
        children: <Widget>[Expanded(child: listRecentUpdates())],
      ),
    );
  }

  ListView listRecentUpdates() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return RecentUpdateListWidget();
        });
  }

  Container topBanner(BuildContext context) {
    return Container(
      height: bannerHeight,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromRGBO(0, 0, 128, 1),
        const Color.fromRGBO(63, 199, 226, 1),
      ])),
    );
  }

  Container bannerContainer() {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
        child: Text(
          "Active Blood Camps",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ));
  }

  Container cardContainer(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: cardContainerTopPadding, right: 20.0, left: 20.0),
      child: Container(
        height: cardContainerHeight,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: new Image.asset(
              'assets/image/imed.png',
              
            ),
          ),
        ),
      ),
    );
  }
}
