import 'package:flutter/material.dart';



class PrivacyPolicyWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PrivacyPolicyWidget();
  }
}


class _PrivacyPolicyWidget extends State<PrivacyPolicyWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Privacy Policy"),
      ),
    );
  }
}