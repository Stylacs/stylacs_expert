import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../size_config.dart';
import 'HomePages/home.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var orentaion = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: (20 / 7.6) * SizeConfig.heightMultiplier,
              ),
              orentaion == Orientation.portrait
                  ? portraitHeader()
                  : landscapHeader(),
              orentaion == Orientation.portrait
                  ? SizedBox(
                      height: 0.0,
                      width: 0.0,
                    )
                  : SizedBox(
                      height: (20 / 7.6) * SizeConfig.heightMultiplier,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget portraitHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Hero(
            tag: "image_hero",
            child: Image.asset(
              "assets/images/stylac.png",
              height: ((MediaQuery.of(context).size.height * 0.30) / 7.6) *
                  SizeConfig.heightMultiplier,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        SizedBox(
          height: (20 / 7.6) * SizeConfig.heightMultiplier,
        ),
        Container(
          width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
              SizeConfig.widthMultiplier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (150 / 7.6) * SizeConfig.heightMultiplier,
                child: animatedIcon(150.0),
              ),
              Text(
                "Thank You",
                style: TextStyle(
                    fontSize: (30 / 7.6) * SizeConfig.heightMultiplier,
                    color: Color.fromRGBO(255, 175, 190, 1)),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
                alignment: Alignment.center,
                child: Text(
                  "Your registration verification has been completed successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(255, 175, 190, 1)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: (100 / 7.6) * SizeConfig.heightMultiplier,
        ),
        Container(
          width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
              SizeConfig.widthMultiplier,
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        vertical: (10 / 7.6) * SizeConfig.heightMultiplier),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(255, 175, 190, 1),
                            width: (2 / 3.6) * SizeConfig.widthMultiplier,
                            style: BorderStyle.solid)),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 175, 190, 1),
                          fontSize: (20 / 7.6) * SizeConfig.textMultiplier),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        PageTransition(
                            child: Home(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 800)),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget landscapHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Hero(
                tag: "image_hero",
                child: Image.asset(
                  "assets/images/stylac.png",
                  height: ((MediaQuery.of(context).size.height * 0.9) / 7.6) *
                      SizeConfig.imageSizeMultiplier,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: (100 / 7.6) * SizeConfig.heightMultiplier,
                    child: animatedIcon(100.0)),
                Text(
                  "Thank You",
                  style: TextStyle(
                      fontSize: (25 / 7.6) * SizeConfig.heightMultiplier,
                      color: Color.fromRGBO(255, 175, 190, 1)),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Your registration verification has been",
                      style: TextStyle(color: Color.fromRGBO(255, 175, 190, 1)),
                    ),
                    Text(
                      "completed successfully",
                      style: TextStyle(color: Color.fromRGBO(255, 175, 190, 1)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: (40 / 7.6) * SizeConfig.heightMultiplier,
        ),
        Container(
          width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
              SizeConfig.widthMultiplier,
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(255, 175, 190, 1),
                            width: (2 / 3.6) * SizeConfig.widthMultiplier,
                            style: BorderStyle.solid)),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 175, 190, 1),
                          fontSize: (20 / 7.6) * SizeConfig.textMultiplier),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: Home(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 800)),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget animatedIcon(iconSize) {
    return ControlledAnimation(
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 2),
      tween: Tween(
          begin: (10.0 / 7.6) * SizeConfig.heightMultiplier,
          end: (iconSize / 7.6) * SizeConfig.heightMultiplier),
      builder: (context, size) {
        return ControlledAnimation(
          duration: Duration(seconds: 2),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, opacity) {
            return Icon(
              Icons.check_circle,
              color: Color.fromRGBO(255, 175, 190, 1).withOpacity(opacity),
              size: size,
            );
          },
        );
      },
    );
  }
}
