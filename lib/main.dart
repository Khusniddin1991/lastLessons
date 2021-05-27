import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_dio/ViwevModel/ViewModel.dart';

import 'Pages/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
    child: MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
