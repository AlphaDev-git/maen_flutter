import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';


class MainScreenWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainScreenWidget();
  }

}


class _MainScreenWidget extends State<MainScreenWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: AssetImage(AppImages.appPLogo,)),
    );
  }

}