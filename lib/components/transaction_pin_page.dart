import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class TransactionPinPage extends StatefulWidget {
  @override
  _TransactionPinPageState createState() => _TransactionPinPageState();
}

class _TransactionPinPageState extends State<TransactionPinPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.4,
      padding: EdgeInsets.only(
        top: 10,
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "First Step",
                style: TextStyles.registerHeadline(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: "Setup your ",
                      style: Theme.of(context).textTheme.title,
                      children: [
                        TextSpan(
                          text: "Transaction PIN",
                          style: TextStyle(
                            color: MyColors.headlineBlack,
                            fontFamily: "Futura",
                            fontSize: 15,
                            letterSpacing: .8,
                            height: 1.3,
                          ),
                        ),
                        TextSpan(text: " to"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "authorise payment",
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter PIN",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: MyColors.defaultPink),
              ),
              child: PinCodeTextField(
                dialogTitle: "Enter PIN",
                textStyle: TextStyles.verifyPin(),
                textInputType: TextInputType.number,
                inactiveColor: Colors.transparent,
                length: 5,
                obsecureText: true,
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
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm PIN",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: MyColors.defaultPink),
              ),
              child: PinCodeTextField(
                dialogTitle: "Enter PIN",
                textStyle: TextStyles.verifyPin(),
                textInputType: TextInputType.number,
                inactiveColor: Colors.transparent,
                length: 5,
                obsecureText: true,
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
            SizedBox(
              height: 25,
            ),
            LargeButton(
              btnColor: MyColors.defaultPurple,
              title: 'Pay Now',
              chevronRight: Icons.chevron_right,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
