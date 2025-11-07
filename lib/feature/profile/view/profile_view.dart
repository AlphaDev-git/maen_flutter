import 'package:flutter/material.dart';
import 'package:maen/feature/profile/widget/profile_widget.dart';
import 'package:maen/models/user_model.dart';



class ProfileView extends StatelessWidget{
  UserModel userModel;
  ProfileView(this.userModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProfileWidget(userModel);
  }
}