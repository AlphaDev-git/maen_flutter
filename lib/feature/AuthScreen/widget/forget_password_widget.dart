import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../Core/Utils/app.images.dart';
import '../../../Core/Widgets/common_widgets.dart';


class ForgetPasswordWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgetPasswordWidget();
  }
}


class _ForgetPasswordWidget extends State<ForgetPasswordWidget>{
  final TextEditingController emailController = TextEditingController();
  bool _loading = false;

  /// 🔹 Send reset email
  Future<void> _sendResetEmail(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      showErrorDialog(context, "برجاء إدخال البريد الإلكتروني");
      return;
    }

    setState(() => _loading = true);

    try {
      // 🔹 If you’re using Firebase Authentication
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      setState(() => _loading = false);

      mesgCustom(
        context,
        "تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.",
      );
    } catch (e) {
      setState(() => _loading = false);
      showErrorDialog(context, "حدث خطأ أثناء الإرسال. برجاء المحاولة لاحقاً.");
      print("Reset password error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Stack(
          children: [
            // 🔹 Background image
            Positioned.fill(
              child: Image.asset(
                AppImages.appbackgroung,
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 Overlay gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.88),
                    Colors.white.withOpacity(0.95),
                    Colors.white.withOpacity(0.999),
                  ],
                ),
              ),
            ),

            // 🔹 Main content
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.07,
                    vertical: screenHeight * 0.05),
                child: Column(
                  children: [
                    // 🔹 App Logo
                    Center(
                      child: Image.asset(
                        AppImages.appPLogo,
                        height: screenHeight * 0.25,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Text(
                      'استرجاع كلمة المرور',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E2A4A),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'يرجى إدخال بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),

                    const SizedBox(height: 30),

                    // 🔹 Email Input Field
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        hintText: 'example@gmail.com',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔹 Send Reset Email Button
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
                        onPressed: () => _sendResetEmail(context),
                        child: const Text(
                          'إرسال رابط إعادة التعيين',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Back to login
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'العودة إلى تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}