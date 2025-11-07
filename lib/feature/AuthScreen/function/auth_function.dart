import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Server_API/auth_api/reg_api.dart';
import '../../../Core/Widgets/common_widgets.dart';
import '../../splash/views/splash_view.dart';


FirebaseAuth _auth=FirebaseAuth.instance;
Future<bool> hasStart() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('auth_token');
}
Future<void> saveStart(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}
Future<String?> getStart() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('auth_token');
  return token;
}
Future<void> deleteStart() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
}


Future<void> LoginMethod(BuildContext context,String email,String password)async{
  try{
   await _auth.signInWithEmailAndPassword(email: email, password: password).whenComplete((){
     String uid = _auth.currentUser!.uid;
     Get.offAll(SplashView(),duration: Duration(seconds: 1),transition: Transition.fade);
   });

  }
  catch(e){
    showErrorDialog(context,e.toString());
  }
}

Future<void> LogoutMethod(BuildContext context)async{
  try{
    await _auth.signOut().whenComplete((){
      Get.offAll(SplashView(),transition: Transition.fadeIn,duration: Duration(seconds: 1));
    });
  }
  catch(e){
    showErrorDialog(context,e.toString());
  }
}



Future<void> CreateStudentAccount(BuildContext context,String name,String email,
    String pass,String conPass,File? img)async{
  try{
    _auth.createUserWithEmailAndPassword(email: email,
        password: pass).whenComplete(()async{
      String? token = await _auth.currentUser!.getIdToken(true);
      AuthService.registerUser(
        name: name,
        email: email,
        password: pass,
        passwordConfirm: conPass,
        role: "student",
        authTokenOrUserId: token.toString());
    }).whenComplete((){
      Get.offAll(SplashView(),transition: Transition.circularReveal,duration: Duration(seconds: 1));
    });
  }

  catch(e){
    showErrorDialog(context,e.toString());
  }
}