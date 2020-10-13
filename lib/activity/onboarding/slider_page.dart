import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/activity/models/onboarding_page_model.dart';

class SliderPage extends StatelessWidget {
  final int index;
  SliderPage(this.index);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return index == 0
        ? Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  Strings.single_logo,
                  color: MyColors.defaultPurple,
                  width: 50,
                ),
                SizedBox(
                  height: size.height / 14,
                ),
                Text(
                  slidesList[index].headline,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  Strings.app_name,
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  slidesList[index].title,
                  style: TextStyle(
                      color: MyColors.titleBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  slidesList[index].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: size.width / 1.3,
                    padding: EdgeInsets.only(bottom: size.height / 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          slidesList[index].headline,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          slidesList[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.6,
                              letterSpacing: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
