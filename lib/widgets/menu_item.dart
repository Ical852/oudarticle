import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';

class MenuItem extends StatelessWidget {

  String image;
  String title;
  bool isIndex;

  MenuItem({required this.image,required this.title, required this.isIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(image: AssetImage(image), width: 25, height: 25,),
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 11,
              fontWeight: isIndex ? bold : light,
              color: isIndex ? Color(0xff191410) : Color(0xffADA8A4)
            ),
          )
        ],
      ),
    );
  }
}