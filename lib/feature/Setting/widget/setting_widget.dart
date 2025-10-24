import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maen/feature/profile/view/profile_view.dart';
import '../../../Core/Utils/app.images.dart';


class SettingWidget extends StatefulWidget{
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.user),
                        radius: 50,
                      ),
                      SizedBox(height: height*0.02,),
                      Text("احمد محمد احمد",
                      style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.person, 'البيانات الشخصية', () {
                        Get.to(ProfileView(),duration: Duration(seconds: 1),transition: Transition.cupertino);
                      }),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.privacy_tip, 'سياسة الخصوصية', () {}),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.description, 'شروط الاستخدام', () {}),
                      SizedBox(height: height*0.02,),
                      _settingsItem(Icons.language, 'اللغة', () {}),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.1),
                          side: const BorderSide(color: Color(0xFF1E2A4A)),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text('تسجيل خروج'),
                      ),
                      SizedBox(height: height*0.02,),
                    ],
                  )
                ],
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