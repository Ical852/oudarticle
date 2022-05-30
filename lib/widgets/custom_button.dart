import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';

class CustomButton extends StatelessWidget {

  String title;
  Function() onpress;

  CustomButton({required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: 24
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        onPressed: onpress,
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: medium
          ),
        ),
      ),
    );
  }
}