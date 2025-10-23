import 'package:flutter/material.dart';

import '../../../Core/Utils/app.images.dart';

class QuranWidget extends StatefulWidget {
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
                          icon: Icon(Icons.arrow_back),
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
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.only(bottom: height * 0.015),
          child: ListTile(
            title: Text(
              surahs[index]['name'],
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${surahs[index]['verses']} آية - ${surahs[index]['type']}',
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.grey[700],
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF1E2A4A),
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            trailing: Icon(Icons.play_circle, color: Colors.grey[700]),
            onTap: () {
              setState(() {
                isSurahView = true;
                selectedSurah = index;
              });
            },
          ),
        );
      },
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
