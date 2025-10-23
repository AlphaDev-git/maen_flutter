import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';


class CourcesWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CourcesWidget();
  }
}


class _CourcesWidget extends State<CourcesWidget>{
  String mycourse="my";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mycourse == "my"
                              ? const Color(0xFF1E2A4A)
                              : Colors.transparent,
                          side: const BorderSide(color: Color(0xFF1E2A4A)),
                          padding: EdgeInsets.symmetric(vertical: height * 0.018),
                        ),
                        onPressed: () {
                          setState(() => mycourse = "my");
                        },
                        child: Text(
                          "خططي",
                          style: TextStyle(
                            color: mycourse == "my" ? Colors.white : const Color(0xFF1E2A4A),
                            fontSize: width * 0.045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1E2A4A)),
                          padding: EdgeInsets.symmetric(vertical: height * 0.018),
                          backgroundColor: mycourse == "female"
                              ? const Color(0xFF1E2A4A)
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() => mycourse = "female");
                        },
                        child: Text(
                          "البرامج",
                          style: TextStyle(
                            color: mycourse == "female" ? Colors.white : const Color(0xFF1E2A4A),
                            fontSize: width * 0.045,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.6,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListView.builder(
                    padding: EdgeInsets.all(width * 0.05),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: height * 0.02),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: width * 0.06,
                            backgroundImage: const AssetImage(AppImages.teacher),
                          ),
                          title: Text('المعلم أحمد بن محمود',
                              style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            'برنامج تصحيح التلاوة\nالتاريخ: 25 أكتوبر 2025\nالوقت: 5:00 مساءً',
                            style: TextStyle(fontSize: width * 0.033),
                          ),
                          trailing: OutlinedButton(
                            onPressed: () {},
                            child: const Text('ابدأ الجلسة'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}