import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenralPage extends StatefulWidget {
  @override
  _GenralPageState createState() => _GenralPageState();
}

class _GenralPageState extends State<GenralPage> {

  String data;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: Text(data??"No Data"),),
    );
  }
}
