import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';

class NavBar {
  static BottomNavigationBar buildBottomNavigationBar(
      int index,
      Function onItemTapped,
      Function onClickProfile,
      ) {
    return BottomNavigationBar(
      elevation: 0.0,
      showUnselectedLabels: false,
      backgroundColor: MyColors.navbarBackground,
      selectedItemColor: MyColors.defaultPurple,
      unselectedItemColor: MyColors.opaquePurple,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Strings.icon_home,
            color: MyColors.opaquePurple,
          ),
          activeIcon: SvgPicture.asset(
            Strings.icon_home,
            color: MyColors.defaultPurple,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Home"),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Strings.icon_insurance,
            color: MyColors.opaquePurple,
          ),
          activeIcon: SvgPicture.asset(
            Strings.icon_insurance,
            color: MyColors.defaultPurple,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Insurance"),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Strings.icon_loans,
            color: MyColors.opaquePurple,
          ),
          activeIcon: SvgPicture.asset(
            Strings.icon_loans,
            color: MyColors.defaultPurple,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Loans"),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Strings.icon_savings,
            color: MyColors.opaquePurple,
          ),
          activeIcon: SvgPicture.asset(
            Strings.icon_savings,
            color: MyColors.defaultPurple,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Savings"),
          ),
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 40,
            child: RawMaterialButton(
              onPressed: onClickProfile,
              shape: PolygonBorder(
                sides: 6,
                borderRadius: 3.0, //
                rotate: 90.0, //
                border: BorderSide(
                  color: MyColors.buttonRed,
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 3.0,
                  rotate: 90.0,
                  child: Container(
                    child: Image.asset(
                      Strings.image_slide_1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text("Profile"),
        ),
      ],
    );
  }
}