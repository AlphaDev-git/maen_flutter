import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Main_Screen/view/main_screen_view.dart';


void delayAndNavigate(BuildContext context) {
  //FirebaseAuth auth=FirebaseAuth.instance;
  Future.delayed(const Duration(seconds: 4)).then((value) {
    // if(auth.currentUser !=null){
    //   Get.offAll(MainScreenView(),duration: Duration(seconds: 1),transition: Transition.zoom);
    // }
    // else{
    //   Get.offAll(AuthLoginView(),duration: Duration(seconds: 1),transition: Transition.zoom);
    // }
    Get.offAll(MainScreenView(),duration: Duration(seconds: 1),transition: Transition.zoom);
  });
}
