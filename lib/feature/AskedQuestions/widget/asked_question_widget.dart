import 'package:flutter/material.dart';

class AskedQuestionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AskedQuestion();
  }
}

class _AskedQuestion extends State<AskedQuestionWidget> {
  final Color mainColor = const Color(0xFF1E2A4A);
  final Color whiteColor = Colors.white;

  final List<Map<String, String>> faqs = [
    {
      "question": "هل المعلمون مجازون بالفعل؟",
      "answer":
      "نعم، جميع المعلمين في معين مجازون ومرخصون ويتم التحقق من شهاداتهم."
    },
    {
      "question": "كيف أتابع تقدم طفلي؟",
      "answer":
      "يمكنك الدخول إلى لوحة الأهل لمتابعة الجلسات والتقدم اليومي والتقارير المفصلة."
    },
    {
      "question": "هل يمكنني إلغاء الاشتراك في أي وقت؟",
      "answer":
      "نعم، يمكنك إلغاء الاشتراك من إعدادات الحساب في أي وقت."
    },
    {
      "question": "هل يمكنني تجربة التطبيق قبل الاشتراك؟",
      "answer":
      "نعم، نحمي المستخدمين بجلسة تجريبية مجانية قبل الاشتراك."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          'الأسئلة الشائعة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
        foregroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final item = faqs[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: mainColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: mainColor.withOpacity(0.2)),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  collapsedIconColor: mainColor,
                  iconColor: mainColor,
                  title: Text(
                    item["question"]!,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        item["answer"]!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
