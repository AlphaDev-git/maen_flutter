import 'package:flutter/material.dart';
import '../../../Core/Utils/app.images.dart';
import 'circular_gradiant_opacity_container.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    faddingAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.appbackgroung,
              fit: BoxFit.cover,

            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.4), // top light layer
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.999),
                    Colors.white.withOpacity(0.999),
                  ]
              )
            ),
          ),
          Center(
            child: Column(
              children: [
                CircularGradiantOpacityContainer(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  hightRatio: 0.45,
                  widthRatio: 0.65,
                  colorOne: Colors.white,
                  colorTwo: Colors.white,
                  colorOneOpacity: 0.5,
                  colorTwoOpacity: 0,
                  radius: 0.46,
                )
              ],
            ),
          ),

          /// Fading logo animation
          Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.30),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Image.asset(AppImages.appPLogo),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.70),
              const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void faddingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )
      ..addListener(() => setState(() {}))
      ..forward()
      ..repeat(reverse: true);
  }
}
