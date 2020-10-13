import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/extras/strings.dart';
import 'package:rgproject/extras/widgets/large_button.dart';
import 'package:rgproject/extras/widgets/slide_bars.dart';
import 'package:rgproject/activity/models/onboarding_page_model.dart';
import 'package:rgproject/activity/onboarding/slider_page.dart';
import 'package:rgproject/activity/signup/login.dart';
import 'package:rgproject/activity/signup/register01.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else
        _currentPage = 0;

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: slidesList.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) => SliderPage(index),
                  ),
                  Container(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Strings.double_logo,
                      color: Colors.black,
                      alignment: Alignment.centerRight,
                      width: size.width / 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < slidesList.length; i++)
                            if (i == _currentPage)
                              SlideBars(true, _currentPage)
                            else
                              SlideBars(false, _currentPage)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Column(
                children: <Widget>[
                  LargeButton(
                    btnColor: MyColors.defaultPurple,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register01(),
                        ),
                      );
                    },
                    title: Strings.createAnAccount,
                    textColor: Colors.white,
                    chevronRight: Icons.chevron_right,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LargeButton(
                    btnColor: MyColors.defaultPink,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    title: Strings.login,
                    textColor: MyColors.defaultPurple,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LargeButton(
                    btnColor: Colors.white,
                    highlight: Colors.white,
                    onPressed: () {},
                    title: Strings.forgotPassword,
                    textColor: MyColors.defaultPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
