import 'package:flutter/material.dart';
import 'package:get/get.dart';


void ErrorCustom(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ),
  );
}
void mesgCustom(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorDialog(BuildContext context , String Error){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title:  Text(
            'خطاء',
            style: TextStyle(
              color: Color(0xFFCE232B), // Red accent color
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            Error,
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFF07933E), // Green accent color
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      }
  );
}