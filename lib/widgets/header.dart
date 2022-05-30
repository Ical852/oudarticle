import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';

class HeaderCustomed extends StatelessWidget {

  String title;
  Function() onBack;

  HeaderCustomed({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Center(
                child: Image(
                  image: AssetImage("assets/ic_back.png"),
                  width: 24,
                  height: 24,
                )
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}