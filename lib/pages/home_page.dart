import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:demo1/viewmodels/imed_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool displayText;
  bool selectedInfo;

  @override
  void initState() {
    displayText = true;
    selectedInfo = false;
    super.initState();
  }

  Future<bool> _onBackPressed(){
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit the app"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: ()=>Navigator.pop(context,false),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=>Navigator.pop(context,true),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed ,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Material(
              child: SafeArea(
                  child: Stack(fit: StackFit.expand, children: <Widget>[
            InkWell(
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    key: ValueKey<int>(imedViewModel.selected.id),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstOut),
                      image:
                          AssetImage('assets/' + imedViewModel.selected.image),
                      fit: BoxFit.cover,
                    )),
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 5 + 16.0,
                            left: 16.0,
                            right:
                                (MediaQuery.of(context).size.width / 3) - 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AnimatedOpacity(
                                opacity: displayText ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 200),
                                child: Text(imedViewModel.selected.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 34.0))),
                            AnimatedOpacity(
                                opacity: displayText ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 200),
                                child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                        imedViewModel.selected.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white70))))
                          ],
                        )),
                  )),
              onTap: () {
                if (!displayText) {
                  setState(() {
                    displayText = true;
                    selectedInfo = false;
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: frostedIconButton(IconButton(
                        icon: Icon(Icons.fiber_smart_record,
                            color: selectedInfo ? Colors.white : Colors.red),
                        onPressed: () {
                          Navigator.pushNamed(context, imedViewModel.selected.sourceUrl);
                          },
                      ))),
                  Spacer(),

                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imedViewModel.imeds.length,
                      itemBuilder: (context, index) {
                        return imedCard(context, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: selectedInfo
                    ? infoCard(context, 'Info')
                    : Container(height: 0, width: 0)),
          ])))),
    );
  }

  Widget frostedRound(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget listCard(BuildContext context, String title, List<String> list) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                  child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(16.0), child: Text(list[index]));
                },
              ))
            ])));
  }

  Widget infoCard(BuildContext context, String title) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                  child: ListView(children: <Widget>[
                
                Text(imedViewModel.selected.description),
              ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // InkWell(
                  //   child: Icon(Icons.favorite_border),
                  //   onTap: () {
                  //     //add to favourites
                  //   },
                  // ),
                  InkWell(
                    child: Icon(Icons.launch),
                    onTap: () {
                      //launch website here using sourceUrl
                      print(imedViewModel.selected.sourceUrl);
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }

  Widget imedCard(BuildContext context, int index) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(right: 16.0, top: 32.0),
          child: frostedEdged(Container(
              width: MediaQuery.of(context).size.width / 1.75,
              color: Colors.white.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/' +
                                          imedViewModel
                                              .imeds[index].image)))),
                        ])),
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width / 3.5),
                              child: Text(imedViewModel.imeds[index].title,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                          ])
              ])))),
      onTap: () {
        setState(() {
          imedViewModel.selected = imedViewModel.imeds[index];
        });
      },
    );
  }
}
