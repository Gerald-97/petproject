import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class AppBarBell extends StatelessWidget {
  final Function onTap;

  AppBarBell({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 20,
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              Strings.icon_bell,
              color: MyColors.opaquePurple,
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}