import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  Future getBlog () async {
    var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore.collection('Blog').getDocuments();
      return qn.documents;
  }

Widget title(DocumentSnapshot list) => Container(
  padding: const EdgeInsets.all(0.0) ,
  child:Card(
    child:Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Image.network(list.data['img']),
        CachedNetworkImage(imageUrl: list.data['img'],),
        
         Column(
          //  mainAxisAlignment: MainAxisAlignment.end,
          //  crossAxisAlignment: CrossAxisAlignment.,
           children: <Widget>[
             
           Text(list.data['title'],
            style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          
    ),
    textAlign: TextAlign.center,
     )
  ],
)
      ], 
     )
     )
     
);



Widget blogtext(DocumentSnapshot list) =>Container(
  padding: const EdgeInsets.only(left:20.0,right: 20.0) ,
  child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
        SizedBox(height: 20.0,),
       Text(list.data['content'],
       style: TextStyle(fontSize: 16.0),
       textAlign: TextAlign.justify,
       )
       ,
       SizedBox(height: 10.0,),

       Text(list.data['context2'],
       style: TextStyle(fontSize: 16.0),
       textAlign: TextAlign.justify,),

       SizedBox(height: 10.0,),

       Text(list.data['context3'],
       style: TextStyle(fontSize: 16.0),
       textAlign: TextAlign.justify,),
  ],
)
);

Widget blogger(DocumentSnapshot list)=> Column(
  children: <Widget>[
    SizedBox(height: 20.0,),
    CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(list.data['photo'])  ,
      radius: 40.0,
    ),
    // CachedNetworkImage(imageUrl: list.data['photo'],
    // imageBuilder: (context,imageProvider)=>Container(
    //   height: 80.0,
    //   width: 80.0,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
    //   ),
    // ),
    // ),
    SizedBox(height: 5.0,),
    Text('~'+list.data['name'],
    style: TextStyle(fontSize: 16.0),),
    SizedBox(height: 20.0,),
  ],
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(context) ,
      appBar: AppBar(
        title: Text("Blog of the day"),
        backgroundColor: Colors.green,
      ),
      body:FutureBuilder(future: getBlog(),builder: (_,snapshot){
        Widget page;
        if(snapshot.hasData){
          page=SingleChildScrollView(
          
          child : Column(
          children: <Widget>[
          title(snapshot.data[0]),
          blogtext(snapshot.data[0]),
          blogger(snapshot.data[0]),
          ],
        ),
          );
        }
        else{
            page =Column(
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only( top:10.0,left: 500.0),
                    )]
              );

        }
        return page;
      })
    );
  }
}


