import 'package:flutter/material.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/onboard_icons.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rgproject/activity/signup/createAccount.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return OnBoardTemplate(
      backButton: true,
      appBarButton: false,
      pageBody: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height / 4,
            ),
            OnBoardGreenIcon(
              iconString: Strings.icon_verification,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              Strings.verification,
              style: TextStyles.registerHeadline(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.verificationCode,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "+2348088390539",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Futura",
                color: MyColors.iconGreen,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: PinCodeTextField(
                      textStyle: TextStyles.verifyPin(),
                      textInputType: TextInputType.number,
                      inactiveColor: Colors.transparent,
                      length: 6,
                      obsecureText: false,
                      backgroundColor: Colors.white,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      fieldHeight: 50,
                      onChanged: null,
                      onCompleted: (val) {
                        print(val);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Strings.didNotReceiveCode,
                        style: TextStyles.onBoardingTitles(),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          Strings.resend,
                          style: TextStyles.appBarRedButton(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  LargeButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ),
                      );
                    },
                    title: 'Confirm',
                    chevronRight: Icons.chevron_right,
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
