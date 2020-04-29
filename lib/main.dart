import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:stylacs_expert/registerScreens/loginScreen.dart';
import 'package:stylacs_expert/size_config.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stylac",
      theme: ThemeData(primaryColor: Color.fromRGBO(255, 175, 190, 1)
          // primaryColor: Color(0xFFAFBD)
          ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AnimationController _animationController;
  // Animation _animation;
  // Playback playback;
  @override
  void initState() {
    super.initState();
    // playback = Playback.PLAY_FORWARD;

    Future.delayed(Duration(seconds: (4).round()), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(seconds: (2).round()),
              child: LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              body: Center(
                  child: Container(
                child: Hero(
                  tag: "image_hero",
                  child: ControlledAnimation(
                    duration: Duration(seconds: (2).round()),
                    playback: Playback.MIRROR,
                    curve: Curves.elasticInOut,
                    tween: Tween(
                        begin: ((MediaQuery.of(context).size.height * 0.25) /
                                7.6) *
                            SizeConfig.heightMultiplier,
                        end:
                            ((MediaQuery.of(context).size.height * 0.6) / 7.6) *
                                SizeConfig.heightMultiplier),
                    builder: (context, scale) {
                      return Image.asset(
                        "assets/images/stylac.png",
                        height: scale,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                ),
              )),
            );
          },
        );
      },
    );
  }
}
