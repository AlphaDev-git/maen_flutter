import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ✅ Scrollable to prevent overflow
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ✅ Centered header image
                Center(
                  child: Image.asset(
                    AppImages.appPLogo,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/deal.png',
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // ✅ Main Sebha section
                InkWell(
                  onTap: incrementCounter,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tasbeehText,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$count',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
