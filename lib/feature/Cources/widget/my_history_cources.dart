import 'package:flutter/material.dart';

import '../../../Core/Utils/app.images.dart';
import 'my_course_card.dart';



class MyHistoryCourcesWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHistoryCources();
  }
}


class _MyHistoryCources extends State<MyHistoryCourcesWidget>{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.03),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: width * 0.06,
                backgroundImage: const AssetImage(AppImages.user),
              ),
              SizedBox(
                width: width * 0.7,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'بحث...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: EdgeInsets.symmetric(vertical: height * 0.01),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " سجل خططي",
                  style: TextStyle(
                      color:  Color(0xFF1E2A4A),
                      fontSize: width * 0.085,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height*0.676,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return MyCourceCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}