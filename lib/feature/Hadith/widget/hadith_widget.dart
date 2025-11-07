import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Core/Utils/app.images.dart';
import 'hadith_details_widget.dart';

class HadithWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HadithWidget();
}

class _HadithWidget extends State<HadithWidget> {
  List<Hadith> hadithList = [];
  final Color mainColor = const Color(0xFF1E2A4A);

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadith();
    }

    return hadithList.isEmpty
        ? const Center(child: CircularProgressIndicator(color: Colors.white))
        : Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'الأحاديث',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(AppImages.appPLogo,
              height: 100, fit: BoxFit.contain, color: Colors.white),
          const SizedBox(height: 20),
          Expanded(
            child: CarouselSlider(
              items: hadithList.map((hadith) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                          () => HadithDetailsScreen(hadith: hadith),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 600),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.95),
                          Colors.grey.shade200,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: const Offset(2, 3),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/hadith_list.png'),
                        fit: BoxFit.cover,
                        opacity: 0.07,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          hadith.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            hadith.content.join('\n'),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'اضغط لقراءة الحديث كاملًا',
                          style: TextStyle(
                            color: mainColor.withOpacity(0.8),
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 550,
                viewportFraction: 0.85,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                enlargeFactor: 0.25,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadHadith() async {
    for (int i = 0; i < 50; i++) {
      var hadithLoad = await rootBundle.loadString('assets/files/h${i + 1}.txt');
      List<String> hadithLines = hadithLoad.split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      Hadith hadith = Hadith(content: hadithLines, title: title);
      hadithList.add(hadith);
      setState(() {});
    }
  }
}

class Hadith {
  String title;
  List<String> content;
  Hadith({required this.content, required this.title});
}
