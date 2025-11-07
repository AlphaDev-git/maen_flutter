import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';

class MyCourceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB5B5B5)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(backgroundImage: AssetImage(AppImages.teacher)),
                    ),
                    Column(
                      children: [
                        Text("البرنامج: تصحيح تلاوة",style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E2A4A)
                        ),),
                        Text("المعلم : محمد محمد المحمدي",style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.bold,
                          color:Color(0xFF1E2A4A)
                        ),),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.notifications_none))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text("الجلسة الاولي",style: TextStyle(
                fontSize: width * 0.037,
                color: Colors.grey[700],
              ),)
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text("الجزئية : سورة النباء من ١ - ١٠",style: TextStyle(
                fontSize: width * 0.037,
                color: Colors.grey[700],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text("اليوم : الاربعاء",style: TextStyle(
                fontSize: width * 0.037,
                color: Colors.grey[700],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text("الساعة الخامسة مساء",style: TextStyle(
                fontSize: width * 0.037,
                color: Colors.grey[700],
              ),),
            ),
            Align(
              widthFactor: width*0.9,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E2A4A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.005),
                  child: Text(
                    "ابداء الجلسة",
                    style: TextStyle(
                      color: const Color(0xFF1E2A4A),
                      fontSize: width * 0.037,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
