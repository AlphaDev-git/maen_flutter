import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/feature/Quran/widget/sura_details_widget.dart';
import 'package:maen/feature/Quran/widget/sura_list_item.dart';
import 'package:maen/models/user_model.dart';
import '../../../Core/Utils/app.images.dart';
import '../quran_const.dart';

class QuranWidget extends StatefulWidget {
  final UserModel userModel;
  const QuranWidget(this.userModel, {super.key});

  @override
  State<QuranWidget> createState() => _QuranWidgetState();
}

class _QuranWidgetState extends State<QuranWidget> {
  bool isSurahView = false;
  int selectedSurah = 0;

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredSurahs = [];

  @override
  void initState() {
    super.initState();
    _initSurahs();
    _searchController.addListener(_onSearchChanged);
  }

  void _initSurahs() {
    filteredSurahs = List.generate(arabicAuranSuras.length, (index) {
      return {
        "ar": arabicAuranSuras[index],
        "en": englishQuranSurahs[index],
        "aya": AyaNumber[index],
      };
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      _initSurahs();
    } else {
      setState(() {
        filteredSurahs = List.generate(arabicAuranSuras.length, (index) {
          return {
            "ar": arabicAuranSuras[index],
            "en": englishQuranSurahs[index],
            "aya": AyaNumber[index],
          };
        }).where((sura) {
          return sura["ar"]!.contains(query) ||
              sura["en"]!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                      setState(() => isSurahView = false);
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
                      controller: _searchController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'بحث عن سورة...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.012,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: filteredSurahs.length + 1, // add extra space at end
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Divider(
          color: Colors.black,
          thickness: 1.5,
        ),
      ),
      itemBuilder: (context, index) {
        if (index == filteredSurahs.length) {
          // Add bottom space so last item is fully visible
          return const SizedBox(height: 80);
        }

        final sura = filteredSurahs[index];
        return InkWell(
          onTap: () {
            Get.to(
              SuraDetailsScreen(),
              arguments: SuraDetailsArgs(
                index: index,
                suraArName: sura["ar"]!,
                suraEnName: sura["en"]!,
              ),
            );
          },
          child: sura_list_item(
            index: index + 1,
            suraAr: sura["ar"]!,
            suraEn: sura["en"]!,
            ayaNum: sura["aya"]!,
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
            'سورة ${filteredSurahs[selectedSurah]['ar']}',
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
