import 'package:flutter/material.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:oudarticle/widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
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
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/paymentsuccess.png"))),
                  ),
                  SizedBox(height: 52),
                  Text(
                    "Payment Success",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Thank you for your kindness for donating to my articles",
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: reguler),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24
                  ),
                  child: CustomButton(
                      title: "Back to Home",
                      onpress: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/home", (route) => false);
                      }),
                ),
            )
          ],
        )
      ),
    );
  }
}