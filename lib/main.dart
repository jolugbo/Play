import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainApp> {
  List<BottomNavigationBarItem> _items;
  int _value = 0;
  String _item = '';
  String _CurrentTime = '';

  _setTime() => setState(() => _CurrentTime = DateTime.now().toString());
  _setValue(String value) => setState(() => _value = int.parse(value));
  _subValue() => setState(() => _value--);
  _addValue() => setState(() => _value++);

  //methods

  //initialise d variables like a constructor...
  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(
      icon: new Icon(Icons.music_note,), title: new Text("Music",),) );
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.playlist_play,), title: new Text("Playlist",)));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.new_releases), title: new Text("Discover")));
  }

  //create graphics/visuals
  @override
  Widget build(BuildContext context) {

    //visuals wrapper
    return new Scaffold(

      //top bar/nav bar
      appBar: new AppBar(
        title: new Text("Thresty"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.offline_pin), onPressed: _addValue, iconSize: 30, color: Colors.red,),
            Align(child: Text('Offlines',style: new TextStyle(fontWeight: FontWeight.bold,textBaseline: TextBaseline.alphabetic,color: Colors.red)),alignment: Alignment.center,)
//          new IconButton(
//              icon: Icon(Icons.minimize), onPressed: _subValue, iconSize: 30)
        ],
        backgroundColor: Colors.black,
      ),

      //footer buttons different from bottom tabs
//      persistentFooterButtons: <Widget>[
//        new IconButton(
//          icon: new Icon(Icons.person),
//          onPressed: _addValue,
//        ),
//        new IconButton(
//          icon: new Icon(Icons.list),
//          onPressed: _subValue,
//        ),
//        new IconButton(
//          icon: new Icon(Icons.settings),
//          onPressed: _addValue,
//        )
//      ],

      //side menu drawer
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          //decoration: prefix0.BlendMode.color(Colors.red),
          child: new Column(
            children: <Widget>[
              new Icon(Icons.person),
              new FlatButton.icon(
                label: new Text("Home"),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.home),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Home"),
              )
              //new IconButton(icon: Icon(Icons.home), onPressed: ()=> Navigator.pop(context))
            ],
          ),
        ),
      ),


      //floater button / note for list
      floatingActionButton: new FloatingActionButton(
        onPressed: _setTime,
        child: Icon(Icons.library_music),
        backgroundColor: Colors.red,
      ),

//bottom navigation tabs
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: _items,
        //selectedItemColor: Colors.blue,
        currentIndex: _value,
        onTap: (int item) {
          setState(() {
            _value = item;
            _item = "Current Value is $_value";
          });
        },
      ),

      //app actual body
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("$_value"),
//              new TextField(
//                decoration: InputDecoration(
//                    icon: Icon(Icons.person_add), hintText: "Name"),
//                onChanged: _setValue,
//                keyboardType: TextInputType.number,
//              ),
              new Text("$_CurrentTime"),
            ],
          ),
        ),
      ),
    );
  }
}
