import 'package:demo1/doctor_page.dart';
import 'package:demo1/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  var currentLocation ;
  List<DocumentSnapshot> doctor = [];
  double distance;
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
        print(currentLocation.latitude);
      }); 
    }); 
  }
  

  Widget com(buildContext,DocumentSnapshot list) => InkWell(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorPage(list : list,))),
    splashColor: Colors.blue,
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(list.data['img'], fit: BoxFit.cover,),
          menuData(list)
        ],
      ),
    ),
  );

// List<Menu> menu;
//   static List<Color> kitGradients = [
//     Colors.blueGrey.shade800,
//     Colors.black87,
//   ];
  // Widget menuColor() => new Container(
  //   decoration: BoxDecoration(boxShadow: <BoxShadow>[
  //     BoxShadow(
  //       color: Colors.black.withOpacity(0.8),
  //       blurRadius: 5.0,
  //     ),
  //   ]),
  // );

  Widget menuData(DocumentSnapshot list) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        list.data['docName'],
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )
    ],
  );

  Widget appBar() => SliverAppBar(
    backgroundColor: Colors.black,
    pinned: true,
    elevation: 10.0,
    forceElevated: true,
    expandedHeight: 20.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      // background: Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(colors:kitGradients)),
      // ),
      title: Row(
        children: <Widget>[
          Text('Doctors')
        ],
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: FutureBuilder(future: getDoctor(),builder: (_, snapshot)
        {
          Widget newListTab;
          if(snapshot.hasData && currentLocation!=null) {


            for (int index = snapshot.data.length - 1; index >= 0; --index){     
               Geolocator().distanceBetween(currentLocation.latitude, currentLocation.longitude, snapshot.data[index].data['location'].latitude, snapshot.data[index].data['location'].longitude)
               .then((dist){
                   distance = dist;
                   print(distance);
                   if(dist/1000 > 5)
                    doctor.add(snapshot.data[index]);
                 });              
            }
            print(doctor.length);




             newListTab = SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0
                ),
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  return com(context,doctor[index]);
                }, childCount: doctor.length));
          }
          else {
              newListTab = SliverToBoxAdapter(child: CircularProgressIndicator(),);
          }
          return CustomScrollView(
          slivers: <Widget>[
            appBar(),
            newListTab
          ],
        );
      }),

      drawer:sideBar(context)


    );
  }
}

