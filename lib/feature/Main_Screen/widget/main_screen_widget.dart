import 'package:flutter/material.dart';
import 'package:maen/Core/Server_API/auth_api/get_me_api.dart';
import 'package:maen/feature/Cources/view/cources_view.dart';
import 'package:maen/feature/Hadith/view/hadith_view.dart';
import 'package:maen/feature/Home/view/home_view.dart';
import 'package:maen/feature/Quran/view/quran_view.dart';
import 'package:maen/feature/Setting/view/setting_view.dart';
import 'package:maen/feature/sebha/view/sebha_view.dart';

import '../../../models/user_model.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  UserModel? _user;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser()async{
    var responce=await getCurrentUser();
    if(responce!=null){
      _user=UserModel.fromJson(responce);
      setState(() {
        _user;
      });
    }
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
     List<Widget> _screens =  [];
     if(_user!=null){
       setState(() {
         _screens=[
           HomeView(_user!),
           QuranView(_user!),
           HadithView(),
           SebhaView(),
           CourcesView(_user!),
           SettingView(_user!),
         ];
       });
     }
    return _user!=null? Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: const Color(0xFF1E2A4A),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            iconSize: 28,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),

                label: 'القرآن',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'حديث',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cached_outlined),
                label: 'سبحة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chair_alt_outlined),
                label: 'الجلسات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'الإعدادات',
              ),
            ],
          ),
        ),
      ),
    ):Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
