//@dart=2.9

import 'package:flutter/material.dart';
import 'package:oudarticle/pages/home.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:oudarticle/widgets/menu_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    Widget renderedWidget() {
      return Home();
    }

    Widget bottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItem(
                image: "assets/ic_home.png",
                title: "Home",
                isIndex: true,
              ),
              MenuItem(
                image: "assets/ic_chat.png",
                title: "Chat",
                isIndex: false,
              ),
              MenuItem(
                image: "assets/ic_favourite.png",
                title: "Favourite",
                isIndex: false,
              ),
              MenuItem(
                image: "assets/ic_profile.png",
                title: "Profile",
                isIndex: false,
              ),
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            renderedWidget(),
            bottomNav()
          ],
        ),
      ),
    );
  }
}