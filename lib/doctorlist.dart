import 'package:demo1/doctor_page.dart';
import 'package:demo1/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:cached_network_image/cached_network_image.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var currentLocation ;
  List<DocumentSnapshot> doctor = [];
  double distance;
  Future _info;
  int count = 1;
  
  Future getDoctor() async {
    var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore.collection('Doctors').getDocuments();
      return qn.documents;
  }

  void initState(){
    super.initState();
    Geolocator().getCurrentPosition().then((currloc){
      setState((){
        print(currentLocation);
        currentLocation = currloc;
      }); 
    }); 
    _info = getDoctor();
   
  }
  

  Widget com(buildContext,DocumentSnapshot list) => Center(
    child : AnimatedContainer(
      duration: Duration(seconds: 2),
      height :MediaQuery.of(context).size.height / 5.5,
      width : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: LinearGradient(colors: kitGradients)),
      child:Material(
        child:InkWell(

    onTap: (){
      doctor = [];
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorPage(list : list,)));
      print("After resetting : " + doctor.length.toString());
    },
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
                child: CircleAvatar(backgroundImage: ExactAssetImage('assets/doctor.png'),radius: 45.0,),
              ),
              Expanded(child:Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[menuData(list)],) ,)
              
            
            ],
          ),
          
        ],
      ),
    ),
        ),
      ),
    ),
    // title: list.data['docName'],
  );

  static List<Color> kitGradients = [
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  Widget menuData(DocumentSnapshot list) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 40.0,),
      Text(
       'Name : '+ list.data['docName'],
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20.0),
      ),
      SizedBox(height: 10.0,),
      Text(
       'Specialization  : '+ list.data['Spec'],
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )
      
    ],
  );

  Widget appBar() =>AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    // pinned: true,
    elevation: 10.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      // background: Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(colors:kitGradients)),
      // ),
      title: Row(
        children: <Widget>[
          Text('Doctors',style: TextStyle(color: Colors.black),)
        ],
      ),
    ),
  );
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + 
          c(lat1 * p) * c(lat2 * p) * 
          (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: appBar(),
      
        body: FutureBuilder(future: _info,builder: (_, snapshot)

        {
          Widget newListTab;
          if(snapshot.hasData && currentLocation != null) {
            if (count & 1 != 0){
              print("Current value of count is: " + count.toString());
              for (int index = snapshot.data.length - 1; index >= 0; --index){     
               print("Ab Chala ");
                distance = calculateDistance(currentLocation.latitude, currentLocation.longitude, snapshot.data[index].data['location'].latitude, snapshot.data[index].data['location'].longitude);          
                print("Distance is : " + distance.toString());
                if (distance < 10)
                  doctor.add(snapshot.data[index]);
              }
            }
            ++count;
             print("NOw the Current value of count is: " + count.toString());
            print(doctor.length);
             newListTab = ListView.builder(
               itemCount: doctor.length,
               itemBuilder: (BuildContext context,int index){
                 return com(context, doctor[index]);
               }
             );

          }
          else {
              newListTab =Column(
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only( top:10.0,left: 500.0),
                    )]
              );
          }
          return newListTab;
      }),

      drawer:sideBar(context)
    );
  }
}





