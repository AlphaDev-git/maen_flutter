import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/feature/AuthScreen/function/auth_function.dart';
import 'package:maen/feature/OnBoarding/view/onboard_view.dart';
import '../../AuthScreen/view/login_view.dart';


void delayAndNavigate(BuildContext context) {
  Future.delayed(const Duration(seconds: 4)).then((value) async{
    if(! await hasStart()){
      Get.offAll(OnBoardView(),duration: Duration(seconds: 1),transition: Transition.zoom);
    }
    else{
      Get.offAll(LoginView(),duration: Duration(seconds: 1),transition: Transition.fadeIn);
    }
  });
}
