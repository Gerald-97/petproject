import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class HomePageSliderTop {
  final AssetImage assetImage;
  final Color defaultColor;
  final String heading, title, text1, text2;
  final bool hideable;
  final Widget icon1, icon2;

  HomePageSliderTop(
    this.assetImage,
    this.defaultColor,
    this.heading,
    this.title,
    this.text1,
    this.text2,
    this.hideable,
    this.icon1,
    this.icon2,
  );
}

List<HomePageSliderTop> topSlider = [
  HomePageSliderTop(
    AssetImage(Strings.wallet_background),
    MyColors.defaultPurple,
    "N12,500.45",
    "Your Wallet balance",
    "Transfer",
    "Fund Wallet",
    true,
    SvgPicture.asset("asset/icon/icon_transfer.svg"),
    Icon(
      Icons.add,
      color: Colors.white,
      size: 18,
    ),
  ),
  HomePageSliderTop(
    AssetImage(Strings.savings_background),
    MyColors.sliderBlue,
    "₦105,990.00",
    "Your Savings balance",
    "Withdraw",
    "Save more",
    true,
    Icon(
      Icons.arrow_downward,
      color: Colors.white,
      size: 18,
    ),
    Icon(
      Icons.add,
      color: Colors.white,
      size: 18,
    ),
  ),
  HomePageSliderTop(
    AssetImage(Strings.payback_background),
    MyColors.sliderRed,
    "-₦15,500.00",
    "Paying back",
    "Pay now",
    "See details",
    false,
    SvgPicture.asset("asset/icon/icon_transfer.svg"),
    Icon(
      Icons.add,
      color: Colors.white,
      size: 18,
    ),
  ),
];
