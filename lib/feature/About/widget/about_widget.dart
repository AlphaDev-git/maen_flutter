import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutWidget();
  }
}

class _AboutWidget extends State<AboutWidget> {
  final Color mainColor = const Color(0xFF1E2A4A);
  final Color whiteColor = Colors.white;

  final List<Map<String, String>> features = [
    {
      "icon": "📘",
      "title": "برنامج حفظ وتثبيت متدرّج",
      "desc": "مسارات منظمة تناسب جميع المستويات.",
    },
    {
      "icon": "🔊",
      "title": "تصحيح تلاوة فوري بالصوت والصورة",
      "desc": "أدوات تسجيل وتحليل صوتي وإرشاد مرئي.",
    },
    {
      "icon": "👩‍🏫",
      "title": "معلمون متخصصون ومجازون",
      "desc": "معلمون مرخصون للمراجعة والإجازة.",
    },
    {
      "icon": "⏰",
      "title": "مرونة كاملة (صباحاً أو مساءً)",
      "desc": "حجز الجلسات يناسب روتينك اليومي.",
    },
    {
      "icon": "🔔",
      "title": "تنبيهات ذكية ومتابعة تلقائية",
      "desc": "تذكيرات ذكية وتقدم يومي يُسجّل تلقائياً.",
    },
    {
      "icon": "📊",
      "title": "متابعة شاملة للأهل (لوحة تحكم)",
      "desc": "لوحة متابعة لتقدم الأبناء.",
    },
    {
      "icon": "👪",
      "title": "مشاركة عائلية (اشتراك واحد للعائلة)",
      "desc": "حساب واحد لأسرتك كاملة.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          "عن معين",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Main Intro Text
            Text(
              'في "معين"، لا نقدّم دروسًا فحسب، بل نصحبك في رحلة قرآنية ملهمة تجمع بين الإتقان والمرونة والمتابعة الدقيقة. معلمك المجاز سيرافقك بخطة مصمَّمة خصيصًا لك، وجدولٍ يناسب وقتك ليكون تعلّم القرآن جزءًا من يومك.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: mainColor,
                fontSize: 16,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            // Section Title
            Text(
              "ما الذي يميّز معين؟",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Feature Cards
            Column(
              children: features.map((item) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: mainColor.withOpacity(0.1)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["icon"]!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item["title"]!,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["desc"]!,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 32),

            // Second Section
            Text(
              "لماذا نحتاج معين؟",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "هل حاولت حفظ القرآن الكريم بمفردك من قبل؟ وتوقفت بعد أيام؟ أو نسيت ما حفظت؟ أو شعرت أن التلاوة ليست كما ينبغي؟\n\nكلنا نواجه ذلك، لأن الحفظ وحدك مرهق... وغياب التوجيه يُضعف الهمة.\n\nلكن الحل الآن بين يديك… معين يسهّل عليك طريق الحفظ... مع نظام متابعة ذكيّ، وتصحيح مباشر من معلّم مجاز...\n\nوَلَقَدْ يَسَّرْنَا الْقُرْآنَ لِلذِّكْرِ فَهَلْ مِن مُّدَّكِرٍ\n\nسورة القمر — آية 17",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
