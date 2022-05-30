//@dart=2.9

import 'dart:async';

import "package:flutter/material.dart";
import 'package:oudarticle/shared/theme.dart';

class SpalshPage extends StatefulWidget {
  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/oudlogo.png")),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  "Ou `D Articles",
                  style: primaryTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: bold,
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}