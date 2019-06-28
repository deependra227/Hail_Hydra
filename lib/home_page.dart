import 'package:flutter/material.dart';
import 'menuModel.dart';
import 'data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  Widget com(buildContext,Menu list) => InkWell(
    onTap: () => {},
    splashColor: Colors.blue,
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          img(list),
          img2(list),
          menuColor(),
          menuData(),
        ],
      ),
    ),
  );

  Widget img(Menu list) => Image.asset(
    list.image,

    fit: BoxFit.cover,
  );
  Widget img2(Menu list) => Image.asset(
    list.image,
    fit: BoxFit.cover,
  );
List<Menu> menu;
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
  Widget menuColor() => new Container(
    decoration: BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
        blurRadius: 5.0,
      ),
    ]),
  );

  Widget menuData() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      Text(
        "Doctors",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )
    ],
  );

  Widget appBar() => SliverAppBar(
    backgroundColor: Colors.black,
    pinned: true,
    elevation: 10.0,
    forceElevated: true,
    expandedHeight: 150.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      background: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:kitGradients)),
      ),
      title: Row(
        children: <Widget>[
          Text('DOCTORS')
        ],
      ),
    ),
  );

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          appBar(),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return com(context,Menu1.menuList[index]);
            }, childCount: Menu1.menuList.length),
          ),


        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Options to be here'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
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
        ),
    );
  }
}