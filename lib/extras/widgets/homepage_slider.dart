import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class HomePageTopFrag extends StatefulWidget {
  final AssetImage assetImage;
  final Color defaultColor;
  final String heading, title, text1, text2;
  final Function method1, method2, onTap;
  final bool hideable;
  final Widget icon1, icon2;

  HomePageTopFrag({
    @required this.assetImage,
    @required this.defaultColor,
    @required this.heading,
    @required this.method1,
    @required this.onTap,
    @required this.method2,
    @required this.title,
    @required this.text1,
    @required this.text2,
    @required this.hideable,
    @required this.icon1,
    @required this.icon2,
  });

  @override
  _HomePageTopFragState createState() => _HomePageTopFragState();
}

class _HomePageTopFragState extends State<HomePageTopFrag> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: widget.assetImage,
            fit: BoxFit.fill,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: widget.defaultColor, blurRadius: 6, offset: Offset(0, 4)),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                bottom: 15,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontFamily: "Futura",
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.hideable && _obscureText
                            ? "-----.--"
                            : widget.heading,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Futura",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white54,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  widget.hideable
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: _obscureText
                                    ? Icon(
                                        Icons.visibility,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : SvgPicture.asset(
                                        Strings.icon_hide_eye,
                                      ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _obscureText ? "Show Bal" : " Hide Bal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Futura",
                                  letterSpacing: 0.5,
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  widget.hideable
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: SvgPicture.asset(
                            "asset/icon/icon_vertical_divider.svg",
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(),
                  InkWell(
                    onTap: widget.method1,
                    child: Row(
                      children: <Widget>[
                        widget.icon1,
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.text1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Futura",
                            letterSpacing: 0.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: SvgPicture.asset(
                      "asset/icon/icon_vertical_divider.svg",
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: widget.method2,
                    child: Row(
                      children: <Widget>[
                        widget.icon2,
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.text2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Futura",
                            letterSpacing: 0.5,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageSliderBottom extends StatelessWidget {
  final String backgroundImagePath, headline, title;
  final double logoWidth;
  final Function onTap;

  HomePageSliderBottom({
    @required this.backgroundImagePath,
    @required this.headline,
    this.title,
    this.logoWidth,
    this.onTap,
    @required this.badge,
  });

  final bool badge;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 1.2,
        padding: EdgeInsets.only(left: 30, top: 25, bottom: 25, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              backgroundImagePath,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              Strings.single_logo,
              color: Colors.white,
              width: logoWidth ?? 25,
            ),
            !badge ? Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset("asset/images/sim-card.png"),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
            ) : SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      headline,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: .8,
                        height: 1.2,
                      ),
                    ),
                    badge
                        ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.iconGreen,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        "₦1000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          height: 1.2,
                        ),
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Futura",
                      color: Colors.white,
                      letterSpacing: 0.2,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
