import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/Core/Utils/app.images.dart';
import 'package:maen/feature/AuthScreen/view/login_view.dart';


class OnBoardWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardWidget();
  }
}


class _OnBoardWidget extends State<OnBoardWidget>{
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Map<String, String>> onboardingData = [
    {
      'image':AppImages.appPLogo,
      'text1': 'مرحبًا بك في مُعين',
      'text2': 'حيث تبدأ رحلتك مع القرآن والعلم والسكينة',
      'button': 'تخطي',
    },
    {
      'image': AppImages.onboard,
      'text1': 'انطلق نحو هدفك القرآني',
      'text2': 'خطوة بخطوة في تجربة مميزة',
      'button': 'تخطي',
    },
    {
      'image': AppImages.onboard2,
      'text1': 'متابعة دقيقة لتقدّمك اليومي',
      'text2': 'خطوة بخطوة بإشراف معلمين متخصصين',
      'button': 'لنبدأ معًا',
    },
  ];
  void _onNext() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
     Get.to(LoginView(),duration: Duration(seconds: 1),transition: Transition.fadeIn);
    }
  }
  @override
  Widget build(BuildContext context) {
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
                      Colors.white.withOpacity(0.99), // top light layer
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.999),
                      Colors.white.withOpacity(0.999),
                    ]
                )
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final data = onboardingData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Expanded(
                              flex: 5,
                              child: Image.asset(
                                data['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              data['text1']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E2B5E),
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['text2']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1E2B5E),
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 30),
                            if (index == 2)
                              ElevatedButton(
                                onPressed: _onNext,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E2B5E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: const Text(
                                  'لنبدأ معًا',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            else
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: _onNext,
                                  child: const Text(
                                    'تخطي',
                                    style: TextStyle(
                                      color: Color(0xFF1E2B5E),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20),

                            /// Dots indicator
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onboardingData.length,
                                    (dotIndex) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  height: 8,
                                  width: _currentPage == dotIndex ? 20 : 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == dotIndex
                                        ? const Color(0xFF1E2B5E)
                                        : const Color(0xFFB0C4DE),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}