import 'package:flutter/material.dart';

  Widget sideBar(BuildContext context) {
    return new Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),

          children: <Widget>[
            UserAccountsDrawerHeader(
              

              currentAccountPicture: CircleAvatar(
               backgroundImage: ExactAssetImage('assets/logo.png'),
               child: InkWell(onTap: () => Navigator.of(context).popUntil(ModalRoute.withName('/homepage'))),
              ),

              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Doctors near me'),
              leading: Icon(Icons.navigate_next),
                onTap: () {
              Navigator.pushReplacementNamed(context, '/doctorlist');
//              Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Medicine'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacementNamed(context, '/medlist');

              },
            ),
            ListTile(
              title: Text('Blood'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacementNamed(context, '/doctorlist');

              },
            ),
            ListTile(
              title: Text('Blog of the day'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacementNamed(context, '/doctorlist');

              },
            ),
          ],
        ),
        elevation: 16.0,
     );
}