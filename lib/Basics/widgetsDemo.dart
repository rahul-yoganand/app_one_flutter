import 'package:flutter/material.dart';

void main() => runApp(MyHomePage(title: 'Name'));

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NAMED',
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home:Scaffold(
          appBar: AppBar(title: Text(this.title), ),
          body: Center(child: Text( 'Hello World',)),
        ),
    );
  }
}