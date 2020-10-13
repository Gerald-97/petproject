import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/components/homepage_bills_items_page.dart';
import 'package:rgproject/components/homepage_top_slider.dart';
import 'package:rgproject/components/homepage_slider_button.dart';
import 'package:rgproject/components/navbar.dart';
import 'package:rgproject/extras/app_config.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/app_bar_bell.dart';
import 'package:rgproject/extras/widgets/homepage_slider.dart';
import 'package:rgproject/extras/widgets/text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = AppConfig.homePage;
  int _topSlidePage = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onClickProfile() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: SvgPicture.asset(
            Strings.icon_person,
            width: 20,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hi, ",
              style: TextStyle(
                color: MyColors.defaultPurple,
              ),
            ),
            Text(
              "Jerryson",
              style: TextStyle(
                color: MyColors.defaultPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: AppBarBell(
              onTap: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar.buildBottomNavigationBar(
        _selectedIndex,
        _onItemTapped,
        _onClickProfile,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 20,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: HomePageTopSlider(_topSlidePage),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          HomePageTopSliderButton(
                            onTap: () {
                              setState(() {
                                _topSlidePage = 0;
                              });
                            },
                            backgroundColor: _topSlidePage == 0
                                ? MyColors.fadedPurple
                                : Colors.white,
                            text: "Wallet",
                            textColor: _topSlidePage == 0
                                ? MyColors.defaultPurple
                                : MyColors.opaquePurple,
                          ),
                          HomePageTopSliderButton(
                            onTap: () {
                              setState(() {
                                _topSlidePage = 1;
                              });
                            },
                            backgroundColor: _topSlidePage == 1
                                ? MyColors.sliderBlueBackground
                                : Colors.white,
                            text: "Savings",
                            textColor: _topSlidePage == 1
                                ? MyColors.sliderBlue
                                : MyColors.opaquePurple,
                          ),
                          HomePageTopSliderButton(
                            onTap: () {
                              setState(() {
                                _topSlidePage = 2;
                              });
                            },
                            backgroundColor: _topSlidePage == 2
                                ? MyColors.sliderRedBackground
                                : Colors.white,
                            text: "Payback",
                            textColor: _topSlidePage == 2
                                ? MyColors.sliderRed
                                : MyColors.opaquePurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                Strings.icon_paybills,
                                width: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Pay bills",
                                style: TextStyles.fadedBlackTextSmall(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: HomePageBillsItemPage.iconButtons1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                Strings.icon_double_transfer,
                                width: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Others",
                                style: TextStyles.fadedBlackTextSmall(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    HomePageBillsItemPage.iconButtonsOthers1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    HomePageBillsItemPage.iconButtonsOthers2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Container(
                height: size.height / 4.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    HomePageSliderBottom(
                      backgroundImagePath: Strings.homepage_bottom_1,
                      badge: true,
                      headline: "Share and earn ",
                      title:
                          "When referred by a friend, Your friend also Gets ₦ 500. A win win right?",
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    HomePageSliderBottom(
                      backgroundImagePath: Strings.homepage_bottom_2,
                      badge: false,
                      headline: "Get a Regent Card",
                      title: "With no extra cost",
                      logoWidth: 28,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
