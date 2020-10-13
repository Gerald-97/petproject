import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';

class HomePageIconButton extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor, borderColor;
  final bool dottedBorder, newTag, others;
  final IconData icon;
  final String text, svgIconPath;

  HomePageIconButton({
    @required this.onTap,
    @required this.text,
    this.others,
    this.svgIconPath,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.dottedBorder,
    this.newTag,
  });

  @override
  Widget build(BuildContext context) {
    bool _newTag = newTag ?? false;
    bool _dottedBorder = dottedBorder ?? false;

    return InkWell(
      onTap: onTap,
      highlightColor: Colors.grey[50],
      child: Container(
        width: 80,
        height: 75,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              bottom: 0,
              child: _dottedBorder
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: borderColor ?? MyColors.sliderRed,
                      strokeWidth: 1,
                      radius: Radius.circular(15),
                      dashPattern: [6, 3],
                      child: Container(
                        height: 67,
                        width: 67,
                        decoration: BoxDecoration(
                          color: backgroundColor ?? MyColors.homeIconRed,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: _widgetColumn(),
                      ),
                    )
                  : Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: backgroundColor ?? MyColors.navbarBackground,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: borderColor ?? Color(0xFFE7E1ED),
                          width: 1,
                        ),
                      ),
                      child: _widgetColumn(),
                    ),
            ),
            _newTag
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 15,
                      width: 30,
                      decoration: BoxDecoration(
                        color: MyColors.sliderRed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "NEW",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Futura",
                            fontSize: 8,
                            letterSpacing: .8,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _widgetColumn() {
    bool _others = others ?? false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _others
            ? Container(
                decoration: BoxDecoration(
                    color: MyColors.sliderRed, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            : svgIconPath != null
                ? SvgPicture.asset(
                    svgIconPath,
                    color: MyColors.defaultPurple,
                    width: 22,
                  )
                : Icon(
                    icon,
                    color: MyColors.defaultPurple,
                  ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black45,
            fontFamily: "Futura",
            fontSize: 10,
            letterSpacing: .8,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
