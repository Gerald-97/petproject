import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/activity/wallet/wallet_home.dart';
import 'package:rgproject/components/transaction_pin_page.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/border_styles.dart';
import 'package:rgproject/extras/widgets/homepage_slider.dart';

class HomePageTopSlider extends StatefulWidget {
  final int index;
  HomePageTopSlider(this.index);

  @override
  _HomePageTopSliderState createState() => _HomePageTopSliderState();
}

class _HomePageTopSliderState extends State<HomePageTopSlider> {
  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? HomePageTopFrag(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WalletPage(),
                ),
              );
            },
            title: "Your Wallet balance",
            assetImage: AssetImage(Strings.wallet_background),
            defaultColor: MyColors.defaultPurple,
            heading: "N12,500.45",
            hideable: true,
            icon1: SvgPicture.asset(
              "asset/icon/icon_transfer.svg",
            ),
            icon2: Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            method1: () {},
            method2: () {},
            text1: "Transfer",
            text2: "Fund Wallet",
          )
        : widget.index == 1
            ? HomePageTopFrag(
                onTap: () {},
                title: "Your Savings balance",
                assetImage: AssetImage(
                  Strings.savings_background,
                ),
                defaultColor: MyColors.sliderBlue,
                heading: "N105,990.00",
                hideable: true,
                icon1: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 18,
                ),
                icon2: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                method1: () {},
                method2: () {},
                text1: "Withdraw",
                text2: "Save more",
              )
            : HomePageTopFrag(
                onTap: () {},
                title: "Paying back",
                assetImage: AssetImage(Strings.payback_background),
                defaultColor: MyColors.sliderRed,
                heading: "-N15,500.00",
                hideable: false,
                icon1: SvgPicture.asset(
                  "asset/icon/icon_transfer.svg",
                ),
                icon2: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                method1: () {
                  _settingModalBottomSheet(context);
                },
                method2: () {},
                text1: "Pay now",
                text2: "See details",
              );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      shape: BorderStyles.modalBottomBorder(),
      context: context,
      builder: (BuildContext bc) {
        return TransactionPinPage();
      },
    );
  }
}
