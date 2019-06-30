import 'package:flutter/material.dart';

  Widget sideBar(BuildContext context) {
    return new Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),

          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Options to be here'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                child: new Text("P"),
              ),

              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);

              },
            ),
          ],
        ),
        elevation: 16.0,
     );
  }