import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hadithitem extends StatelessWidget {
  String title;
  String content;
  hadithitem({required this.title,required this.content});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Colors.black
        ),

        image: DecorationImage(
            fit: BoxFit.fill,
            image:AssetImage('assets/images/hadith_list.png')),
      ),

      child: Column(
        children: [
          Text(title,style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 15,),
          Expanded(child: Text(content,style: Theme.of(context).textTheme.headlineSmall,))
        ],
      ),
    );
  }
}
