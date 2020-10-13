import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rgproject/activity/signup/share_and_earn.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/components/progress_page.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/form_input.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/onboard_icons.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

enum PasswordStatus { none, weak, moderate, strong, veryStrong }

class _CreateAccountState extends State<CreateAccount> {
  bool _checkTAndC = false;
  double _passwordStrength;
  PasswordStatus passStatus;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _passwordStrength = 0.0;
    _passwordStatusChecker();
    super.initState();
  }

  void _passwordStatusChecker() {
    if (_passwordStrength == 0.0) {
      setState(() {
        passStatus = PasswordStatus.none;
      });
    } else if (_passwordStrength > 0.0 && _passwordStrength <= 0.25) {
      setState(() {
        passStatus = PasswordStatus.weak;
      });
    } else if (_passwordStrength > 0.25 && _passwordStrength <= 0.5) {
      setState(() {
        passStatus = PasswordStatus.moderate;
      });
    } else if (_passwordStrength > 0.5 && _passwordStrength <= 0.75) {
      setState(() {
        passStatus = PasswordStatus.strong;
      });
    } else {
      setState(() {
        passStatus = PasswordStatus.veryStrong;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardTemplate(
      backButton: false,
      appBarButton: false,
      pageBody: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              OnBoardGreenIcon(),
              SizedBox(
                height: 30,
              ),
              Text(
                Strings.createAccount,
                style: TextStyles.onBoardingHeadlines(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      Strings.createAccountTitle,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FormInput(
                      hintText: 'johndoe@mail.com',
                      textInputType: TextInputType.emailAddress,
                      labelText: 'Email Address',
                      errorText: 'Invalid email address',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormInput(
                      labelText: 'First Name',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormInput(
                      labelText: 'Last Name',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormInput(
                      labelText: 'Password',
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          _passwordStrength = estimatePasswordStrength(val);
                          _passwordStatusChecker();
                          print(
                              "Password Strength: $_passwordStrength \nPassword status: $passStatus");
                        });
                      },
                      validator: (val) {},
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LinearPercentIndicator(
                            percent: _passwordStrength,
                            lineHeight: 10,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            backgroundColor: Colors.grey[200],
                            progressColor: passStatus == PasswordStatus.none
                                ? Colors.black26
                                : passStatus == PasswordStatus.weak
                                    ? Colors.red[300]
                                    : passStatus == PasswordStatus.moderate
                                        ? Colors.yellow[300]
                                        : passStatus == PasswordStatus.strong
                                            ? Colors.blue[300]
                                            : MyColors.passwordStrength,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Strength: ",
                              style: TextStyle(
                                color: MyColors.titleBlack,
                                letterSpacing: .8,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              passStatus == PasswordStatus.none
                                  ? " "
                                  : passStatus == PasswordStatus.weak
                                      ? "Weak"
                                      : passStatus == PasswordStatus.moderate
                                          ? "Moderate"
                                          : passStatus == PasswordStatus.strong
                                              ? "Strong"
                                              : "Very Strong",
                              style: TextStyle(
                                letterSpacing: .8,
                                fontSize: 12,
                                color: passStatus == PasswordStatus.weak
                                    ? Colors.red[300]
                                    : passStatus == PasswordStatus.moderate
                                        ? Colors.yellow[300]
                                        : passStatus == PasswordStatus.strong
                                            ? Colors.blue[300]
                                            : MyColors.passwordStrength,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Text(
                                Strings.termsVerification,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _checkTAndC = !_checkTAndC;
                                  });
                                },
                                child: Center(
                                  child: CustomSwitchButton(
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    checkedColor: Colors.white,
                                    unCheckedColor: Colors.white,
                                    backgroundColor: _checkTAndC
                                        ? MyColors.passwordStrength
                                        : Colors.grey[400],
                                    checked: _checkTAndC,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        LargeButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) {
                                  return ProgressPage();
                                },
                                fullscreenDialog: true,
                              ),
                            );
                            Future.delayed(Duration(seconds: 3), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShareAndEarn(),
                                ),
                              );
                            });
                          },
                          title: 'Sign Up',
                          chevronRight: Icons.chevron_right,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
