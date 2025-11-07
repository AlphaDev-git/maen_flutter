import 'package:flutter/material.dart';

import '../../../Core/Utils/app.images.dart';


class CourceCardWidget extends StatelessWidget{
  String Images;
  String title;
  String subTitle;
  CourceCardWidget({required this.Images,required this.subTitle,required this.title});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Card(
      color: Color(0xFF1E2A4A),
      child: Container(
        width: width * 0.55,
        margin: EdgeInsets.only(right: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
                bottom: Radius.circular(12),
              ),
              child: Image.asset(
                AppImages.teacher,
                height: height * 0.15,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.005,
                            ),
                            child: Text(
                              subTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.037,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}