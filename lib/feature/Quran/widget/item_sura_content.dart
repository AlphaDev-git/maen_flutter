import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class itemsuracontent extends StatelessWidget {
  String content;
  int index;
  itemsuracontent({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(12),
        child: Text('$content [${index+1}]',style: Theme.of(context).textTheme.headlineLarge,textDirection: TextDirection.rtl,));
  }
}
