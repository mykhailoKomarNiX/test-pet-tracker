import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title = 'TOP';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(title: title),
    );
  }
}

class Pet extends StatefulWidget {
  Pet({this.border = false});

  final bool border;
  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: widget.border ? Border.all() : null,
          shape: BoxShape.circle,
          color: Colors.grey),
    );
  }
}

class PetPhoto extends StatefulWidget {
  @override
  _PetPhotoState createState() => _PetPhotoState();
}

class _PetPhotoState extends State<PetPhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              'Pet Photo',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        Positioned(
            left: 30.0,
            top: 130,
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Pet Name',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Pet breed and pet age',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))),
        Positioned(
            right: 20.0,
            top: 20,
            child: Container(
              width: 120,
              height: 35,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 15,
                    height: 15,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text('Device'),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () => print('more'),
            icon: Icon(Icons.more_horiz),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => print('more'),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Pet(border: true),
                  Pet(),
                  Pet(),
                ],
              ),
            ),
            PetPhoto(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Today's Status",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ));
  }
}
