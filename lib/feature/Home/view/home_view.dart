import 'package:flutter/material.dart';
import 'package:maen/feature/Home/widget/home_widget.dart';
import 'package:maen/models/user_model.dart';


class HomeView extends StatelessWidget{
  UserModel userModel;
  HomeView(this.userModel);
  @override
  Widget build(BuildContext context) {
    return HomeWidget(userModel);
  }
}