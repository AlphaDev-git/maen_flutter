import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/Core/Utils/app.images.dart';
import 'package:maen/feature/AuthScreen/view/signup_view.dart';
import 'package:maen/feature/Main_Screen/view/main_screen_view.dart';


class LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginWidget();
  }
}


class _LoginWidget extends State<LoginWidget>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
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
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Center(
                    child: Image.asset(
                      AppImages.appPLogo,
                      height: screenHeight*0.3,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Email field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الالكتروني',
                      hintText: 'youssefmahmoud@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password field
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      hintText: 'كلمة المرور',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Remember me + Forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          const Text('تذكرني'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height:screenHeight*0.02 ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E2A4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.to(MainScreenView(),duration: Duration(seconds: 1),transition: Transition.fade);
                      },
                      child: const Text(
                        'تسجيل',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                   SizedBox(height:screenHeight*0.05),

                  // Create account button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1E2A4A)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.to(SignUpView(),duration: Duration(seconds: 1),transition: Transition.fade);
                      },
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(fontSize: 18, color: Color(0xFF1E2A4A)),
                      ),
                    ),
                  ),

                   SizedBox(height:screenHeight*0.02),
                  const Text('أو', style: TextStyle(fontSize: 16)),
                   SizedBox(height:screenHeight*0.02),

                  // Social media icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}