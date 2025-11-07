import 'package:flutter/material.dart';


class AboutWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AboutWidget();
  }
}

class _AboutWidget extends State<AboutWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("About"),
      ),
    );
  }
}