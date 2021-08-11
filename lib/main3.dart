import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my first app',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
            fontFamily: 'IndieFlower',
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('welcome'),
              FlatButton(
                onPressed: () {},
                child: Text('click'),
                color: Colors.amber,
              ),
              Container(color: Colors.cyan, child: Text('inside a container')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('welcome'),
              FlatButton(
                onPressed: () {},
                child: Text('click'),
                color: Colors.amber,
              ),
              Container(color: Colors.cyan, child: Text('inside a container')),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Text('press'),
        onPressed: () {},
      ),
    );
  }
}