import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class OnBoardTemplate extends StatelessWidget {
  final Key scaffoldKey;
  final Widget pageBody;
  final Function onTapAppBarButton;
  final String appBarButtonText;
  final bool appBarButton, backButton;

  OnBoardTemplate({
    @required this.backButton,
    @required this.appBarButton,
    this.onTapAppBarButton,
    this.appBarButtonText,
    this.scaffoldKey,
    @required this.pageBody,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFFBFAFC),
      key: scaffoldKey ?? key,
      appBar: AppBar(
        leading: backButton
            ? BackButton(
                color: MyColors.defaultPurple,
              )
            : SizedBox(),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: appBarButton ? onTapAppBarButton : null,
                child: appBarButton
                    ? Text(
                        appBarButtonText,
                        style: TextStyles.appBarRedButton(),
                      )
                    : SizedBox(),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(
                Strings.double_logo,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: pageBody,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
