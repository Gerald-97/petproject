import 'package:flutter/material.dart';
import 'package:rgproject/activity/signup/register01.dart';
import 'package:rgproject/components/onboarding_template.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/form_input.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/onboard_icons.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:rgproject/activity/signup/verification.dart';

class Register02 extends StatefulWidget {
  @override
  _Register02State createState() => _Register02State();
}

class _Register02State extends State<Register02> {
  TextEditingController phoneController = new TextEditingController();
  String phoneNumber = "";
  final _formKey = GlobalKey<FormState>();


  void onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check() {
    print("Full Text: " + this.phoneNumber + phoneController.text);
  }

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
              height: 40
            ),
            Text(
              Strings.getStarted,
              style: TextStyles.registerHeadline(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.getStartedPhone,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 40
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: FormInput(
                      prefixIcon: CountryCodePicker(
                        initialSelection: '+234',
                        favorite: ['+234', 'NG'],
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                        showFlag: false,
                        showFlagDialog: true,
                        //comparator: (a, b) => b.name.compareTo(a.name),
                        //Get the country information relevant to the initial selection
                        //onInit: (code) => print("${code.name} ${code.dialCode}"),
                      ),
                      hintText: '01234567890',
                      labelText: Strings.phoneNumber,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register01(),
                        ),
                      );
                    },
                    child: Text(
                      Strings.useBVNInstead,
                      style: TextStyles.appBarRedButton(),
                    ),
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
