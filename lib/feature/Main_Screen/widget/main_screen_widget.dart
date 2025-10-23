import 'package:flutter/material.dart';
import 'package:maen/feature/Cources/view/cources_view.dart';
import 'package:maen/feature/Home/view/home_view.dart';
import 'package:maen/feature/Quran/view/quran_view.dart';
import 'package:maen/feature/Setting/view/setting_view.dart';


class MainScreenWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainScreenWidget();
  }

}


class _MainScreenWidget extends State<MainScreenWidget>{
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeView(),
    QuranView(),
    CourcesView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          height: height * 0.09,
          decoration: const BoxDecoration(
            color: Color(0xFF1E2A4A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
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
    );
  }
}