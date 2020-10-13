import 'package:flutter/material.dart';

class HomePageTopSliderButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final Function onTap;
  final String text;

  HomePageTopSliderButton({
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontFamily: "Futura",
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
