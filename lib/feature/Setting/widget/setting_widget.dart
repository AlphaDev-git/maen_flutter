import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/feature/About/view/about_view.dart';
import 'package:maen/feature/AskedQuestions/view/asked_question_view.dart';
import 'package:maen/feature/AuthScreen/function/auth_function.dart';
import 'package:maen/feature/CallUs/view/call_us_view.dart';
import 'package:maen/feature/Hadith/view/hadith_view.dart';
import 'package:maen/feature/Language/view/language_view.dart';
import 'package:maen/feature/PrivacyPolicy/view/privacy_policy_view.dart';
import 'package:maen/feature/TermsOfUses/view/terms_of_uses_view.dart';
import 'package:maen/feature/profile/view/profile_view.dart';
import 'package:maen/feature/sebha/view/sebha_view.dart';
import 'package:maen/models/user_model.dart';
import '../../../Core/Utils/app.images.dart';


class SettingWidget extends StatefulWidget{
  UserModel userModel;
  SettingWidget(this.userModel);
  @override
  State<StatefulWidget> createState() {
    return _SettingWidget();
  }
}


class _SettingWidget extends State<SettingWidget>{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                        Colors.white.withOpacity(0.88), // top light layer
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.999),
                        Colors.white.withOpacity(0.999),
                      ]
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 53),
              child: SingleChildScrollView(
                child:
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.user),
                        radius: 50,
                      ),
                      SizedBox(height: height*0.02,),
                      Text("${widget.userModel.name}",
                      style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.person, 'البيانات الشخصية', () {
                        Get.to(ProfileView(widget.userModel),duration: Duration(seconds: 1),transition: Transition.cupertino);
                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.language, 'اللغة', () {
                        Get.to(LanguageView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.cached_outlined, 'السبحة', () {
                        Get.to(SebhaView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.book, 'حديث', () {
                        Get.to(HadithView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.person, 'المعلمون', () {}),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.paste, 'الباقات', () {}),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.verified, 'الشهادات', () {}),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.ballot_sharp, 'عن معين', () {
                        Get.to(AboutView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.question_mark, 'الاسئلة الشائعة', () {
                        Get.to(AskedQuestionView(),transition: Transition.cupertinoDialog,duration: Duration(seconds: 1));
                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.call, 'تواصل معنا', () {
                        Get.to(CallUsView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.privacy_tip, 'سياسة الخصوصية', () {
                        Get.to(PrivacyPolicyView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.description, 'شروط الاستخدام', () {
                        Get.to(TermsOfUsesView(),duration: Duration(seconds: 1),transition: Transition.cupertino);

                      }),
                      SizedBox(height: height*0.02,),
              SizedBox(height: height * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.1),
                      side: const BorderSide(color: Color(0xFF1E2A4A)),
                    ),
                    onPressed: () {
                      LogoutMethod(context);
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('تسجيل خروج'),
                  ),
                  SizedBox(height: height*0.02,),
                    ],
                  ),
              ]

                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1E2A4A)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_back_ios, size: 16),
      onTap: onTap,
    );
  }
}