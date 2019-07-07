import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';


class MedList extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color(0x000000),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell(
            key: _foldingCellKey,
            frontWidget: _buildFrontWidget(),
            innerTopWidget: _buildInnerTopWidget(),
            innerBottomWidget: _buildInnerBottomWidget(),
            cellSize: Size(MediaQuery.of(context).size.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('cell opened'),
            onClose: () => print('cell closed')),

      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
        color: Color.fromRGBO(93, 144, 227,1),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("CARD",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
            FlatButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Open",
              ),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
            )
          ],
        ));
  }

  Widget _buildInnerTopWidget() {
    return Container(

        color: Color.fromRGBO(6, 73, 184, 1),
        alignment: Alignment.center,
        child: Text("TITLE",
            style: TextStyle(
                color: Color.fromRGBO(0,0,0, 1.0),
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          child: Text(
            "Close",
          ),
          textColor: Colors.white,
          color: Colors.indigoAccent,
          splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}