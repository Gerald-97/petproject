import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Wallet",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: MyColors.defaultPurple,
                image: DecorationImage(
                  image: AssetImage(
                    Strings.wallet_background,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: size.height / 4,
            ),
          ],
        ),
      ),
    );
  }
}
