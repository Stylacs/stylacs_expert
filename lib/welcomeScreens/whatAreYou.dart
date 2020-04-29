import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stylacs_expert/size_config.dart';
import 'package:stylacs_expert/welcomeScreens/whatServices.dart';

class WhatAreYou extends StatefulWidget {
  @override
  _WhatAreYouState createState() => _WhatAreYouState();
}

class _WhatAreYouState extends State<WhatAreYou> {
  bool beautySalon = false;
  bool homeBased = false;
  bool both = false;

  List<String> selectedType = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 175, 190, 1),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[topWaveShap(), bottomNav()],
          ),
        ),
      ),
    );
  }

  Widget topWaveShap() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: (20 / 7.6) * SizeConfig.heightMultiplier,
        ),
        ClipPath(
          clipper: WaveClipperTwo(reverse: true),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
            width: MediaQuery.of(context).size.width,
            height: (643 / 7.6) * SizeConfig.heightMultiplier,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: (100 / 7.6) * SizeConfig.heightMultiplier,
                ),
                Text("What Are You?",
                    style: TextStyle(
                        fontSize: (30 / 7.6) * SizeConfig.heightMultiplier)),
                SizedBox(
                  height: (70 / 7.6) * SizeConfig.heightMultiplier,
                ),
                selectType(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget selectType() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              beautySalon = !beautySalon;
            });
            if (beautySalon) {
              setState(() {
                selectedType.add("Beauty Salon");
              });
            } else {
              setState(() {
                selectedType.remove("Beauty Salon");
              });
            }
            print(selectedType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
            height: (50 / 7.6) * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 2.5,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 0.0)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Beauty Salon",
                  style: TextStyle(
                      fontSize: (18 / 7.6) * SizeConfig.heightMultiplier),
                ),
                Icon(LineIcons.check,
                    color: beautySalon ? Colors.green : Colors.transparent,
                    size: (30 / 7.6) * SizeConfig.heightMultiplier)
              ],
            ),
          ),
        ),
        SizedBox(
          height: (30 / 7.6) * SizeConfig.heightMultiplier,
        ),
        InkWell(
          onTap: () {
            setState(() {
              homeBased = !homeBased;
            });
            if (homeBased) {
              setState(() {
                selectedType.add("Home Based");
              });
            } else {
              setState(() {
                selectedType.remove("Home Based");
              });
            }
            print(selectedType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
            height: (50 / 7.6) * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 2.5,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 0.0)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Home Based",
                  style: TextStyle(
                      fontSize: (18 / 7.6) * SizeConfig.heightMultiplier),
                ),
                Icon(LineIcons.check,
                    color: homeBased ? Colors.green : Colors.transparent,
                    size: (30 / 7.6) * SizeConfig.heightMultiplier)
              ],
            ),
          ),
        ),
        SizedBox(
          height: (30 / 7.6) * SizeConfig.heightMultiplier,
        ),
        InkWell(
          onTap: () {
            setState(() {
              both = !both;
            });
            if (both) {
              setState(() {
                selectedType.add("Having Salon also Home Based");
              });
            } else {
              setState(() {
                selectedType.remove("Having Salon also Home Based");
              });
            }
            print(selectedType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
            height: (50 / 7.6) * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 2.5,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 0.0)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Having Salon also Home Based",
                  style: TextStyle(
                      fontSize: (18 / 7.6) * SizeConfig.heightMultiplier),
                ),
                Icon(LineIcons.check,
                    color: both ? Colors.green : Colors.transparent,
                    size: (30 / 7.6) * SizeConfig.heightMultiplier)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget bottomNav() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width,
      height: (70 / 7.6) * SizeConfig.heightMultiplier,
      color: Colors.white,
      child: IconButton(
        icon: Icon(
          FontAwesomeIcons.arrowRight,
          color: Color.fromRGBO(255, 175, 190, 1),
          size: (45 / 7.6) * SizeConfig.heightMultiplier,
        ),
        onPressed: () {
          if (selectedType.isNotEmpty) {
            Navigator.of(context).push(PageTransition(
                child: WhatServices(
                  selectedType: selectedType,
                ),
                duration: Duration(milliseconds: 700),
                type: PageTransitionType.rightToLeftWithFade));
          } else {
            Fluttertoast.showToast(
                msg: "Plz Select One Option!!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER);
          }
        },
      ),
    );
  }
}
