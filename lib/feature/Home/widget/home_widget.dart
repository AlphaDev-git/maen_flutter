import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';
import 'package:maen/feature/Home/widget/teacher_card.dart';
import 'package:maen/models/user_model.dart';

import '../../Cources/widget/cource_card_widget.dart';

class HomeWidget extends StatefulWidget {
  UserModel userModel;
  HomeWidget(this.userModel);
  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.01,
                        ),
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
                    ' البرامج',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E2A4A),
                    ),
                  ),
                  Text(
                    'المزيد',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.34,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CourceCardWidget(title: "انشئ خطتك مع معين",Images: "",subTitle: "ابداء الان",),
                    CourceCardWidget(title: "تصحيح التلاوة",Images: "",subTitle: "انشئ خطتك الان",),
                    CourceCardWidget(title: "الجفظ والمراجعة",Images: "",subTitle: "انشئ خطتك الان",),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),

              // Programs Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' الباقات',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E2A4A),
                    ),
                  ),
                  Text(
                    'المزيد',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
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

              SizedBox(height: height * 0.04),

              // Teachers Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' المعلمون',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'المزيد',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              // SizedBox(
              //   height: height * 0.94,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //       return TeacherCard(
              //         name: 'المعلمة منى أحمد',
              //         specialty: 'تحفيظ القرآن الكريم',
              //         imagePath: AppImages.teacher,
              //         rating: 4,
              //         title: "احجز الجلسه",
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: height * 0.2,
                child: ListView(
                  children: [
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
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
