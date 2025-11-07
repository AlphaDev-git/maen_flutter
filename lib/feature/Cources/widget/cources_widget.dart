import 'package:flutter/material.dart';
import 'package:maen/Core/Utils/app.images.dart';
import 'package:maen/feature/Cources/widget/my_course_card.dart';
import 'package:maen/feature/Cources/widget/my_course_widget.dart';
import 'package:maen/feature/Cources/widget/my_history_cources.dart';
import 'package:maen/models/user_model.dart';


class CourcesWidget extends StatefulWidget{
  UserModel userModel;
  CourcesWidget(this.userModel);
  @override
  State<StatefulWidget> createState() {
    return _CourcesWidget();
  }
}


class _CourcesWidget extends State<CourcesWidget>with TickerProviderStateMixin{
  String mycourse="my";
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children:  [
            MyCourcesWidget(),
            MyHistoryCourcesWidget(),
          ],
        ),
      ),
    );
  }
}