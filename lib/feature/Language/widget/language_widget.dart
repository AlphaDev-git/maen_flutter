import 'package:flutter/material.dart';



class LanguageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LanguageWidget();
  }
}


class _LanguageWidget extends State<LanguageWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Language"),
      ),
    );
  }
}