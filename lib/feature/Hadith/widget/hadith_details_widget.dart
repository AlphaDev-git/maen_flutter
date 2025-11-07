import 'package:flutter/material.dart';
import '../../../Core/Utils/app.images.dart';
import 'hadith_widget.dart';

class HadithDetailsScreen extends StatelessWidget {
  final Hadith hadith;
  final Color mainColor = const Color(0xFF1E2A4A);

  HadithDetailsScreen({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          hadith.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // subtle background image
          Opacity(
            opacity: 0.08,
            child: Image.asset(
              AppImages.appPLogo,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.contain,
            ),
          ),

          // main hadith text
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      hadith.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      hadith.content.join('\n'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
