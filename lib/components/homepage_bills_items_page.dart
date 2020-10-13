import 'package:flutter/material.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/homepage_icon_button.dart';

class HomePageBillsItemPage {
  static List<HomePageIconButton> iconButtons1 = [
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Cable",
      icon: Icons.live_tv,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Electricity",
      icon: Icons.lightbulb_outline,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: true,
      text: "Flight",
      icon: Icons.card_travel,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: true,
      newTag: false,
      text: "Others",
      others: true,
    ),
  ];

  static List<HomePageIconButton> iconButtonsOthers1 = [
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Loan",
      svgIconPath: Strings.icon_loan_outline,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: true,
      text: "Airtime",
      icon: Icons.phone,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Data",
      icon: Icons.wifi_tethering,
    ),
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Transfer",
      svgIconPath: Strings.icon_double_transfer_purple,
    ),
  ];
  static List<HomePageIconButton> iconButtonsOthers2 = [
    HomePageIconButton(
      onTap: () {},
      dottedBorder: false,
      newTag: false,
      text: "Pension",
      svgIconPath: Strings.icon_person_outline,
    ),
  ];
}
