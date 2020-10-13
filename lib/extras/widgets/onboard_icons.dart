import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class OnBoardGreenIcon extends StatelessWidget {
  final String iconString;

  OnBoardGreenIcon({ this.iconString});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.backgroundGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.bottomLeft,
      height: 120,
      width: 120,
      child: Center(
        child: SvgPicture.asset(
          iconString ?? Strings.icon_register,
          width: 35,
        ),
      ),
    );
  }
}