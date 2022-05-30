import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';

class InputCustom extends StatelessWidget {

  String label;
  String hint;
  TextEditingController controller;

  InputCustom({required this.label, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: reguler
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 17
              ),
              hintText: hint,
              hintStyle: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: reguler
              )
            ),
          )
        ],
      ),
    );
  }
}