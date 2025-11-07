import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:maen/Core/Utils/app.images.dart';

class SebhaHome extends StatefulWidget {
  const SebhaHome({super.key});

  @override
  State<SebhaHome> createState() => _SebhaHomeState();
}

class _SebhaHomeState extends State<SebhaHome>
    with SingleTickerProviderStateMixin {
  int count = 0, totalCount = 0;
  String tasbeehText = 'سبحان الله';

  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  final Color mainColor = const Color(0xFF1E2A4A);
  final Color textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _glowAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    if (!_controller.isAnimating) {
      _controller.forward(from: 0);
    }

    setState(() {
      count++;
      totalCount++;

      if (totalCount == 10) {
        tasbeehText = 'الله أكبر';
        count = 0;
      } else if (totalCount == 25) {
        tasbeehText = 'لا إله إلا الله';
        count = 0;
      } else if (totalCount == 55) {
        tasbeehText = 'الحمد لله';
        count = 0;
      } else if (totalCount == 88) {
        tasbeehText = 'لا حول ولا قوة إلا بالله';
        count = 0;
      } else if (totalCount == 99) {
        tasbeehText = 'سبحان الله';
        count = 0;
        totalCount = 0;
      }
    });
  }

  void resetSebha() {
    setState(() {
      count = 0;
      totalCount = 0;
      tasbeehText = 'سبحان الله';
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: mainColor.withOpacity(0.3),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'السبحة',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: resetSebha,
            tooltip: 'إعادة التصفير',
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 🌙 Background
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    mainColor,
                    mainColor.withOpacity(0.85),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),

            // 🌿 Main Sebha
            GestureDetector(
              onTap: incrementCounter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * math.pi,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/images/SebhaBody.png',
                      height: size.width * 0.8,
                      fit: BoxFit.contain,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, _) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: _glowAnimation.value * 3,
                              spreadRadius: _glowAnimation.value,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              transitionBuilder: (child, anim) =>
                                  FadeTransition(opacity: anim, child: child),
                              child: Text(
                                tasbeehText,
                                key: ValueKey<String>(tasbeehText),
                                style: TextStyle(
                                  fontSize: 28,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.white.withOpacity(0.5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '$count',
                              style: TextStyle(
                                fontSize: 36,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.white.withOpacity(0.7),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🌙 Verse and logo bottom
            Positioned(
              bottom: size.height * 0.05,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.appPLogo,
                    height: size.height * 0.07,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                    style: TextStyle(
                      color: textColor.withOpacity(0.9),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
