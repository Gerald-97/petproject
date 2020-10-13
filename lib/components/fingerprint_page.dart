import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class FingerprintPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2.5,
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 50,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 4,
                      color: MyColors.titleBlack,
                    ),
                    Divider(
                      height: 4,
                      color: MyColors.titleBlack,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Strings.fPrintHeadline,
                style: TextStyles.headlineNotBold(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Strings.fPrintTitle,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 40,
              ),
              SvgPicture.asset(
                Strings.icon_fPrint_scanner,
                width: 60,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              Strings.cancel,
              style: TextStyle(
                fontSize: 14,
                color: MyColors.buttonRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}