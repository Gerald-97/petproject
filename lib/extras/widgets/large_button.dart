import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';

class LargeButton extends StatelessWidget {
  final Color btnColor;
  final Function onPressed;
  final String title;
  final TextStyle textTheme;
  final Color textColor;
  final Color highlight;
  final IconData chevronRight;

  LargeButton({
    this.btnColor,
    @required this.onPressed,
    @required this.title,
    this.textTheme,
    this.textColor,
    this.chevronRight,
    this.highlight
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: highlight,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: btnColor ?? MyColors.defaultPurple,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                title,
                style: textTheme ??
                    TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 14,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          chevronRight != null
              ? Icon(
            chevronRight,
            color: Colors.white,
            size: 20,
          )
              : SizedBox(),
        ],
      ),
    );
  }
}