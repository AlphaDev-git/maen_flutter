import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';
import 'package:maen/feature/Home/widget/teacher_card.dart';



class HomeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}


class _HomeWidget extends State<HomeWidget>{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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

              SizedBox(height: height * 0.03),

              // Banner
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  width: double.infinity,
                  height: height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              // Programs Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'أفضل البرامج',
                    style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(fontSize: width * 0.04, color: Colors.grey[600]),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                height: height * 0.34,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Container(
                        width: width * 0.55,
                        margin: EdgeInsets.only(right: width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12),bottom:Radius.circular(12) ),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'المعلم أحمد بن محمود',
                                        style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'برنامج تصحيح التلاوة',
                                        style: TextStyle(fontSize: width * 0.035, color: Colors.grey[600]),
                                      ),
                                      Text(
                                        'السعر 2000 ريال',
                                        style: TextStyle(fontSize: width * 0.035, color: Colors.grey[600]),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
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
                                              "احجز الجلسة",
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.04),

              // Teachers Section
              Text(
                'أفضل المعلمين',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: height * 0.02),

              // Teacher Card
              TeacherCard(
                name: 'المعلمة منى أحمد',
                specialty: 'تحفيظ القرآن الكريم',
                imagePath: AppImages.teacher,
                rating: 4,
                title: "احجز الجلسه",
              ),
            ],
          ),
        ),
      ),
    );
  }
}