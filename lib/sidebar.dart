import 'package:flutter/material.dart';

  Widget sideBar(BuildContext context) {
    return new Drawer(
    
        child: ListView(
          padding: EdgeInsets.all(0),
          

          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: ExactAssetImage('assets/logo.png',)),
                color: Colors.white,
              ),
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text('Doctors near me'),
              leading: Icon(Icons.navigate_next),
                onTap: () {
              Navigator.pushReplacementNamed(context, '/doctorby');
              },
            ),
            ListTile(
              title: Text('Medicine'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/medlist');
              },
            ),
            ListTile(
              title: Text('Blood'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacementNamed(context, '/bloodcamp');

              },
            ),
            ListTile(
              title: Text('Blog of the day'),
              leading: Icon(Icons.navigate_next),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushReplacementNamed(context, '/blog');

              },
            ),
          ],
        ),
        elevation: 16.0,
     );
}