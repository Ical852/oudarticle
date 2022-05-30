import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';

class PaymentItem extends StatelessWidget {

  String label;
  String value;

  PaymentItem({required this.label, required this.value});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: reguler,
              color: Color(0xffADA8A4)
            ),
          ),
          Text(
            value,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: reguler
            ),
          )
        ],
      ),
    );
  }
}