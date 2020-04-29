import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../size_config.dart';
import 'oval-right-clipper.dart';

class MyDrawer {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Color.fromRGBO(255, 175, 190, 1);

  Widget buildDrawer(context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(
              left: (16.0 / 3.6) * SizeConfig.widthMultiplier,
              right: (40.0 / 3.6) * SizeConfig.widthMultiplier),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: (300.0 / 3.6) * SizeConfig.widthMultiplier,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: active,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  glowAvatar(),
                  SizedBox(height: (5.0 / 7.6) * SizeConfig.heightMultiplier),
                  Text(
                    "Umi Hani",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "umihani@gmail.com",
                    style: TextStyle(
                        color: active,
                        fontSize: (16.0 / 7.6) * SizeConfig.heightMultiplier),
                  ),
                  SizedBox(height: (30.0 / 7.6) * SizeConfig.heightMultiplier),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "My profile"),
                  _buildDivider(),
                  _buildRow(Icons.message, "Messages", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Notifications",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(
        color: active, fontSize: (16.0 / 7.6) * SizeConfig.heightMultiplier);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: (5.0 / 7.6) * SizeConfig.heightMultiplier),
      child: InkWell(
        onTap: () {
          print("clicked");
        },
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: (10.0 / 3.6) * SizeConfig.widthMultiplier),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          if (showBadge)
            Padding(
              padding: EdgeInsets.only(
                  right: (5.0 / 3.6) * SizeConfig.widthMultiplier),
              child: Material(
                color: Colors.deepOrange,
                elevation: 5.0,
                shadowColor: Colors.red,
                borderRadius: BorderRadius.circular(
                    (5.0 / 7.6) * SizeConfig.heightMultiplier),
                child: Container(
                  width: (25.0 / 3.6) * SizeConfig.widthMultiplier,
                  height: (25.0 / 7.6) * SizeConfig.heightMultiplier,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(
                        (5.0 / 7.6) * SizeConfig.heightMultiplier),
                  ),
                  child: Text(
                    "10+",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: (12.0 / 7.6) * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }

  Widget glowAvatar() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 700),
      curve: Curves.fastLinearToSlowEaseIn,
      tween: Tween(begin: 0.0, end: 55.0),
      builder: (context, animation) {
        return AvatarGlow(
          startDelay: Duration(milliseconds: 1000),
          glowColor: Colors.blueGrey,
          endRadius: (75.0 / 7.6) * SizeConfig.heightMultiplier,
          duration: Duration(milliseconds: 2000),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          child: Material(
            color: Color.fromRGBO(255, 175, 190, 1),
            elevation: 8.0,
            shape: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/flutter.jpg'),
                backgroundColor: Colors.grey[100],
                radius: (animation / 7.6) * SizeConfig.heightMultiplier,
              ),
            ),
          ),
          shape: BoxShape.circle,
          animate: true,
          curve: Curves.fastOutSlowIn,
        );
      },
    );
  }
}
