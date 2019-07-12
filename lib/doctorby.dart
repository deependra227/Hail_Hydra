import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sidebar.dart';

class DoctorBy extends StatefulWidget {
  @override
  _DoctorByState createState() => _DoctorByState();
}

class _DoctorByState extends State<DoctorBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(context),
       appBar: AppBar(
        title: Text("Search By",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(

        children: <Widget>[
          SizedBox(height: 50.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              doctor('assets/hospital_icon.png','Search By Hospitals','/places' ),
              doctor('assets/doctor_icon.png','Search By Doctors' ,'/doctorlist'),
            ],
          ),
        ],
      ),
    );
    
  }

  Widget  doctor(String img,String title,String path)=>  InkWell(
        onTap: () => Navigator.pushNamed(context, path),
        splashColor: Colors.blue,
        child: Card(
          // margin: EdgeInsets.all(11.0),
          
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: 
              Container(
                width: MediaQuery.of(context).size.width/2.3,
                height: 180.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Image.asset(img,height: 100.0,alignment: Alignment.center,),
                    SizedBox(height: 10.0,),
                    Divider(color: Colors.black,),
                    SizedBox(height: 10.0,),
                    Text(title,style: TextStyle(fontSize: 15),)
                  ],
                )
                )
            
          
        ),
      );
}