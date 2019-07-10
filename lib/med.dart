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
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(future: getMed(),builder:(_,snapshot)
      {
        Widget newList;
        if(snapshot.hasData){
          
          newList=ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return SimpleFoldingCell(
                  frontWidget: _buildFrontWidget(snapshot.data[index],index),
                  innerTopWidget: _buildInnerTopWidget(snapshot.data[index],index),
                  innerBottomWidget: _buildInnerBottomWidget(index),
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
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(med.data['name'],
                    style: TextStyle(
                        color: Color(0xFF2e282a),
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800)),
                FlatButton(
                  onPressed: () {
                    SimpleFoldingCellState foldingCellState =
                    context.ancestorStateOfType(
                        TypeMatcher<SimpleFoldingCellState>());
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "Open",
                  ),
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  splashColor: Colors.white.withOpacity(0.5),
                )
              ],
            ));
      },
    );
  }

  Widget _buildInnerTopWidget(DocumentSnapshot med,int index) {
    return Container(
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(med.data['name'],
            style: TextStyle(
                color: Color(0xFF2e282a),
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget(int index) {
    return Builder(builder: (context) {
      return Container(
        color: Color(0xFFecf2f9),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FlatButton(
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
        ),
      );
    });
  }
}