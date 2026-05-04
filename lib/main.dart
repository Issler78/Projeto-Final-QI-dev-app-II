import 'package:flutter/material.dart';
import 'package:pulsetime/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseTime',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }

}
