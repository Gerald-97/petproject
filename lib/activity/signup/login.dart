import 'package:flutter/material.dart';
import 'package:rgproject/activity/overview/home_main.dart';
import 'package:rgproject/components/fingerprint_page.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/border_styles.dart';
import 'package:rgproject/extras/widgets/form_input.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/login_method.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginKey { pin, print }

class _LoginState extends State<Login> {
  LoginKey _selectMethod = LoginKey.pin;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return OnBoardTemplate(
      backButton: true,
      appBarButton: true,
      appBarButtonText: Strings.forgotPassword,
      onTapAppBarButton: () {},
      pageBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: size.height / 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LoginMethod(
                _selectMethod == LoginKey.pin ? true : false,
                Strings.pin,
                Strings.icon_pin,
                () {
                  setState(() {
                    _selectMethod = LoginKey.pin;
                  });
                },
              ),
              LoginMethod(
                _selectMethod == LoginKey.print ? true : false,
                Strings.fingerprint,
                Strings.icon_fingerprint,
                () {
                  setState(() {
                    _selectMethod = LoginKey.print;
                  });
                  _settingModalBottomSheet(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            Strings.loginHeadline,
            style: TextStyles.onBoardingHeadlines(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Strings.loginTitle,
            style: TextStyles.onBoardingTitles(),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormInput(
                  enabled: _selectMethod == LoginKey.pin ? true : false,
                  hintText: 'example@mail.com',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                FormInput(
                  enabled: _selectMethod == LoginKey.pin ? true : false,
                  hintText: 'Your PIN',
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  height: 50,
                ),
                LargeButton(
                  btnColor: MyColors.defaultPurple,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  title: 'Login',
                  chevronRight: Icons.chevron_right,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      shape: BorderStyles.modalBottomBorder(),
      context: context,
      builder: (BuildContext bc) {
        return FingerprintPage();
      },
    );
  }
}
