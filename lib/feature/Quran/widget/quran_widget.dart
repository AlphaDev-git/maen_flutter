import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/feature/Quran/widget/sura_details_widget.dart';
import 'package:maen/feature/Quran/widget/sura_list_item.dart';
import 'package:maen/models/user_model.dart';

import '../../../Core/Utils/app.images.dart';
import '../quran_const.dart';

class QuranWidget extends StatefulWidget {
  UserModel userModel;
  QuranWidget(this.userModel);
  @override
  State<StatefulWidget> createState() {
    return _QuranWidget();
  }
}

class _QuranWidget extends State<QuranWidget> {
  bool isSurahView = false;
  int selectedSurah = 0;

  final List<Map<String, dynamic>> surahs = [
    {'name': 'الفاتحة', 'verses': 7, 'type': 'مكية'},
    {'name': 'البقرة', 'verses': 286, 'type': 'مدنية'},
    {'name': 'آل عمران', 'verses': 200, 'type': 'مدنية'},
    {'name': 'النساء', 'verses': 176, 'type': 'مدنية'},
    {'name': 'المائدة', 'verses': 120, 'type': 'مدنية'},
  ];

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
            children: [
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSurahView
                      ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSurahView = !isSurahView;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                      : CircleAvatar(
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

              // View section
              SizedBox(
                height: height * 0.9,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.04),
                  child: isSurahView
                      ? _buildSurahView(width, height)
                      : _buildIndexView(width, height),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndexView(double width, double height) {
    // ✅ FIXED: removed Expanded (it caused ParentDataWidget error)
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(
            color: Colors.black,
            thickness: 2,
          ),
        );
      },
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(
              SuraDetailsScreen(),
              arguments: SuraDetailsArgs(
                index: index,
                suraArName: arabicAuranSuras[index],
                suraEnName: englishQuranSurahs[index],
              ),
            );
          },
          child: sura_list_item(
            index: index + 1,
            ayaNum: AyaNumber[index],
            suraAr: arabicAuranSuras[index],
            suraEn: englishQuranSurahs[index],
          ),
        );
      },
      itemCount: AyaNumber.length,
    );
  }

  Widget _buildSurahView(double width, double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'سورة ${surahs[selectedSurah]['name']}',
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.all(width * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Text(
              'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ\n'
                  'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ\n'
                  'الرَّحْمَـٰنِ الرَّحِيمِ\n'
                  'مَالِكِ يَوْمِ الدِّينِ\n'
                  'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ\n'
                  'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ\n'
                  'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.05,
                height: 2,
                fontFamily: 'KFGQPC Uthmanic Script HAFS',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
