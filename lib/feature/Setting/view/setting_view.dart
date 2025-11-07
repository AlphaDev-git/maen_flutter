import 'package:flutter/material.dart';
import 'package:maen/feature/Setting/widget/setting_widget.dart';
import 'package:maen/models/user_model.dart';


class SettingView extends StatelessWidget{
  UserModel userModel;
  SettingView(this.userModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SettingWidget(userModel);
  }
}