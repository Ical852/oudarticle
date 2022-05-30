import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {

  String image;

  OverviewItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}