import 'package:flutter/material.dart';
import 'package:rgproject/activity/signup/verification.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/form_input.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/onboard_icons.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';
import 'package:rgproject/activity/signup/register02.dart';

class Register01 extends StatefulWidget {
  @override
  _Register01State createState() => _Register01State();
}

class _Register01State extends State<Register01> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return OnBoardTemplate(
      backButton: true,
      appBarButton: false,
      pageBody: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height / 4,
            ),
            OnBoardGreenIcon(),
            SizedBox(
              height: 40,
            ),
            Text(
              Strings.getStarted,
              style: TextStyles.registerHeadline(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.getStartedBVN,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: FormInput(
                      hintText: '01234567890',
                      labelText: Strings.BVNFull,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        Strings.doNotHaveBVN,
                        style: TextStyles.onBoardingTitles(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register02(),
                            ),
                          );
                        },
                        child: Text(
                          Strings.usePhone,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Verification(),
                        ),
                      );
                    },
                    title: 'Next',
                    chevronRight: Icons.chevron_right,
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
