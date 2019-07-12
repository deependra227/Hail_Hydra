import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MedList extends StatelessWidget {
  Future getMed() async {
    var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore.collection('Medicine').getDocuments();
      return qn.documents;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: sideBar(context),
      ),
      appBar: AppBar(
        title: Text("Medicine"),
        backgroundColor: Color.fromRGBO(254, 163, 81, 1),
      ),
      body: FutureBuilder(future: getMed(),builder:(_,snapshot)
      {
        Widget newList;
        if(snapshot.hasData){
          
          newList=ListView.builder(
            itemCount: 
            snapshot.data.length,
            itemBuilder: (context, index) {
              return SimpleFoldingCell(
                  frontWidget: _buildFrontWidget(snapshot.data[index],index),
                  innerTopWidget: _buildInnerTopWidget(snapshot.data[index],index),
                  innerBottomWidget: _buildInnerBottomWidget(snapshot.data[index],index),
                  cellSize: Size(MediaQuery.of(context).size.width, 125),
                  padding: EdgeInsets.all(15),
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: 10,
                  onOpen: () => print('$index cell opened'),
                  onClose: () => print('$index cell closed'));
            }
            );
        }
        else{
          newList =Column(
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only( top:10.0,left: 500.0),
                    )]
              );
        }
          return newList;
      })
    );
  }



// Container(

//         color: Color(0xFF2e282a),
//         child: 
//       ),




  Widget _buildFrontWidget(DocumentSnapshot med,int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
            color: Color.fromRGBO(254, 189, 122,1),
            alignment: Alignment.center,
            child: InkWell(
              onTap:(){ SimpleFoldingCellState foldingCellState =
                    context.ancestorStateOfType(
                        TypeMatcher<SimpleFoldingCellState>());
                    foldingCellState?.toggleFold();
                  },
              child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(med.data['name'],
                    style: TextStyle(
                        color: Color(0xFF2e282a),
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800)),
                //  FlatButton(
                //   onPressed: () {
                //     SimpleFoldingCellState foldingCellState =
                //     context.ancestorStateOfType(
                //         TypeMatcher<SimpleFoldingCellState>());
                //     foldingCellState?.toggleFold();
                //   },
                //   child: Text(
                //     med.data['price'],
                //   ),
                //   textColor: Colors.white,
                //   color: Colors.indigoAccent,
                //   splashColor: Colors.white.withOpacity(0.5),
                // )
              ],
            )) ,
            );
            
      },
    );
  }

  Widget _buildInnerTopWidget(DocumentSnapshot med,int index) {
    return Container(
        color: Color.fromRGBO(249, 150, 50, 1),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(med.data['des'],
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 15.0,
                  
                  ),textAlign: TextAlign.justify,),
        )
                );
  }

  Widget _buildInnerBottomWidget(DocumentSnapshot med, int index) {
    return Builder(builder: (context) {
      return Container(
        // height: 750,
        color: Color(0xFFecf2f9),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              // Container(child: Text('Common Uses',style: TextStyle(fontWeight:FontWeight.bold ),))
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: Text(
                  med.data['use'],
                  textAlign: TextAlign.justify,
                  
                ),
              ),
              FlatButton(
            onPressed: () {
              SimpleFoldingCellState foldingCellState = context
                  .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
              foldingCellState?.toggleFold();
            },
            child: Text(
              "Close",
            ),
            textColor: Colors.white,
            color: Colors.indigoAccent,
            splashColor: Colors.white.withOpacity(0.5),
          ),
            ],
          )
        ),
      );
    });
  }
}