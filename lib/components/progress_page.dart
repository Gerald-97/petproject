import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rgproject/extras/strings.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> with TickerProviderStateMixin{
  AnimationController rotationController;
  
  @override
  void initState() {
    // TODO: implement initState
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      upperBound: pi * 2,
      vsync: this,
    );

    rotationController.repeat(min: 0.0, max: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xEE330065),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                      child: SvgPicture.asset(
                        Strings.icon_loading,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Creating Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .7,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Get ready for what's in store for you",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          letterSpacing: .7,
                          wordSpacing: .5,
                          height: 1.2,
                        ),
                      ),
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
