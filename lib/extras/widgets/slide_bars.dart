import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';

class SlideBars extends StatelessWidget {
  final bool isActive;
  final int currentPage;

  SlideBars(this.isActive, this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 5,
      width: 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: indicatorColors(),
      ),
    );
  }

  Color indicatorColors() {
    Color color;
    if (isActive && currentPage == 0) {
      color = MyColors.defaultPurple;
    }
    else if (currentPage == 0) {
      color = MyColors.defaultPink;
    }
    else if(isActive && currentPage != 0) {
      color = Colors.white;
    }
    else color = Colors.grey;

    return color;
  }

}
