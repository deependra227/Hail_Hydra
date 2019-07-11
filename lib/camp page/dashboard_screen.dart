import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:demo1/sidebar.dart';
class BloodCamp extends StatefulWidget {
  BloodCamp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BloodCampState createState() => _BloodCampState();
}

class _BloodCampState extends State<BloodCamp> {
  double bannerHeight, listHeight, listPaddingTop;
  double cardContainerHeight, cardContainerTopPadding;

  Future getBlood () async {
    var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore.collection('Blood').getDocuments();
      return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    bannerHeight = MediaQuery.of(context).size.height * .095;
    listHeight = MediaQuery.of(context).size.height * .75;
    cardContainerHeight = 200;
    cardContainerTopPadding = bannerHeight / 2;
    listPaddingTop = cardContainerHeight - (bannerHeight / 2);
    return Scaffold(
      drawer: sideBar(context) ,
      appBar: AppBar(
        title: Text("Active Blood Camps"),
        backgroundColor: Color.fromRGBO(200, 0, 0, 1),
      ),
     
      body: FutureBuilder(future: getBlood(),builder: (_,snapshot){
          Widget blood;
          if(snapshot.hasData){
                  blood=Stack(
              
              children: <Widget>[
                
                new Column(
                  children: <Widget>[
                    topBanner(context),
                    Expanded(child: activecamplist(context,snapshot))
                  ],
                ),
                // bannerContainer(),
                cardContainer(context),
              ],
            );
          }
          else{
            blood =Column(
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only( top:10.0,left: 500.0),
                    )]
              );

        }
        return blood;

      })
    );
  }







  Container activecamplist(BuildContext context,AsyncSnapshot snapshot) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      padding:
          new EdgeInsets.only(top: listPaddingTop, right: 10.0, left: 10.0),
      child: Column(
        children: <Widget>[Expanded(child: listRecentUpdates(snapshot))],
      ),
    );
  }

  ListView listRecentUpdates(AsyncSnapshot snapshot) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return recentUpdateListWidget(snapshot.data[index]);
        });
  }

  Container topBanner(BuildContext context) {
    return Container(
      height: bannerHeight,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromRGBO(200, 0, 0, 1),
        const Color.fromRGBO(200, 0, 0, 1),
      ])),
    );
  }

  // Container bannerContainer() {
  //   return Container(
  //       alignment: Alignment.topCenter,
  //       padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
  //       child: Text(
  //         "",
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
  //       ));
  // }

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
              'assets/blood.jpg',
              
            ),
          ),
        ),
      ),
    );
  }
 Widget recentUpdateListWidget(DocumentSnapshot list) =>
  Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.white54,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: bloodGroupThumbnailWidget(list),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  list.data['name'],
                  
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Text(
                  'hello'
                
                 ),
              )
            ],
          )
        ],
      ),
    );



  Widget bloodGroupThumbnailWidget(DocumentSnapshot list)=> Stack(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(list.data['img'])
            ],
          )
        ),
      ],
    );





}