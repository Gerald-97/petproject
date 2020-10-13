import 'package:flutter/material.dart';

class HomePageIconBills {
  final Function onTap;
  final bool dottedBorder, newTag, others;
  final String text;
  final IconData icon;

  HomePageIconBills(
    this.onTap,
    this.dottedBorder,
    this.newTag,
    this.others,
    this.text,
    this.icon,
  );
}
