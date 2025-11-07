import 'package:flutter/material.dart';
import 'package:maen/feature/Cources/widget/cources_widget.dart';
import 'package:maen/models/user_model.dart';


class CourcesView extends StatelessWidget{
  UserModel userModel;
  CourcesView(this.userModel);
  @override
  Widget build(BuildContext context) {
    return CourcesWidget(userModel);
  }
}