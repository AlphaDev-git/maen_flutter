import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maen/feature/AuthScreen/widget/login_widget.dart';
import '../../Main_Screen/view/main_screen_view.dart';


class LoginView extends StatelessWidget{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return _auth.currentUser!=null?MainScreenView():LoginWidget();
  }
}