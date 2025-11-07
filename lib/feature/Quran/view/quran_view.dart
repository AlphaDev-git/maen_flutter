import 'package:flutter/material.dart';
import 'package:maen/feature/Quran/widget/quran_widget.dart';
import 'package:maen/models/user_model.dart';


class QuranView extends StatelessWidget{
  UserModel userModel;
  QuranView(this.userModel);
  @override
  Widget build(BuildContext context) {
    return QuranWidget(userModel);
  }
}