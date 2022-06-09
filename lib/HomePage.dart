import 'package:flutter/material.dart';
import 'package:yth/PhotoUpload.dart';
import 'PhotoUpload.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Post Page"),
      ),
      body: new Container(),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.red,
        child: new Container(
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.newspaper),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {},
                ),
                new IconButton(
                  icon: new Icon(Icons.add_a_photo),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return new UploadPhotoPage();
                    }));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
