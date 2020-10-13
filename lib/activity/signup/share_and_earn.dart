import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/activity/overview/home_main.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/form_input.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/onboard_icons.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';
import 'package:rgproject/extras/widgets/utils.dart';

class ShareAndEarn extends StatefulWidget {
  @override
  _ShareAndEarnState createState() => _ShareAndEarnState();
}

class _ShareAndEarnState extends State<ShareAndEarn> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _copy = "REF-0010c";
  String _refCode;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFBFAFC),
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: SvgPicture.asset(
              Strings.double_logo,
              color: MyColors.defaultPurple,
              alignment: Alignment.centerRight,
              width: size.width / 1.5,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppBar(
                  actions: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Skip",
                            style: TextStyles.appBarRedButton(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            OnBoardGreenIcon(
                              iconString: Strings.icon_s_and_e,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              Strings.sAndE,
                              style: TextStyles.onBoardingHeadlines(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Earn ',
                                      style: TextStyles.onBoardingTitles(),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'NGN1000',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Futura",
                                            color: MyColors.iconGreen,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' when your invite makes their first transaction',
                                          style: TextStyles.onBoardingTitles(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 70,
                              padding: EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                                right: 10,
                                left: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: MyColors.iconGreen, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _copy,
                                    style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 3,
                                      fontFamily: "Futura",
                                      color: MyColors.iconGreen,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.content_copy,
                                      color: MyColors.defaultPurple,
                                    ),
                                    onPressed: () {
                                      Clipboard.setData(
                                          ClipboardData(text: _copy));
                                      MyUtils.showFlushBar(
                                          context, "Copied to clipboard");
                                      print(_copy);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Divider(
                          color: MyColors.defaultPink,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Enter referral code to get ',
                                        style: TextStyles.onBoardingTitles(),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'NGN500',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Futura",
                                              color: MyColors.iconGreen,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' totally on the house',
                                            style:
                                                TextStyles.onBoardingTitles(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FormInput(
                                backgroundColor: MyColors.fadedPink,
                                labelText: "Referral Code",
                                onSaved: (val) {
                                  _refCode = val;
                                  print(_refCode);
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              LargeButton(
                                onPressed: () {
                                  _formKey.currentState.save();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                title: "Continue",
                                chevronRight: Icons.check,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
