import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class LoginMethod extends StatelessWidget {
  final bool isActive;
  final String iconPath, title;
  final Function onTap;

  LoginMethod(
      this.isActive,
      this.title,
      this.iconPath,
      this.onTap
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height / 5,
        width: size.width / 2.3,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: size.height / 5.5,
              width: size.width / 2.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isActive ? MyColors.focusGreen : MyColors.titleBlack,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset(
                      iconPath,
                      color: isActive ? MyColors.focusGreen : MyColors.titleBlack,
                      width: 35,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color:
                        isActive ? MyColors.focusGreen : MyColors.titleBlack,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isActive
                ? Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                Strings.icon_tick,
                width: 30,
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}