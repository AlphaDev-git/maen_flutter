import 'package:flutter/material.dart';

class sura_list_item extends StatelessWidget {
  String suraEn;
  String suraAr;
  String ayaNum;
  int index;
  sura_list_item({super.key, required this.suraEn,
    required this.suraAr,required this.ayaNum,
    required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/sharaislamy.png',color:const Color(0xFF1E2A4A),),
            Text(index.toString(),style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
            ),)
          ],
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(suraAr,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:const Color(0xFF1E2A4A)
                  ),),
                  Text('$ayaNum ايات',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF1E2A4A)
                  ),),
                ],
              ),
              Text(suraEn,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF1E2A4A)
              ),),
            ],
          ),
        ),

      ],
    );
  }
}
