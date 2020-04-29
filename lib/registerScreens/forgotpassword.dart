import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import '../size_config.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var orentaion = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                orentaion == Orientation.portrait
                    ? portraitHeader()
                    : landscapHeader(),
                SizedBox(
                  height: (40 / 7.6) * SizeConfig.heightMultiplier,
                ),
                signUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget portraitHeader() {
    return Container(
      alignment: Alignment.center,
      child: Hero(
        tag: "image_hero",
        child: Image.asset(
          "assets/images/stylac2.png",
          height: ((MediaQuery.of(context).size.height * 0.35) / 7.6) *
              SizeConfig.heightMultiplier,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Widget landscapHeader() {
    return Container(
      alignment: Alignment.center,
      child: Hero(
        tag: "image_hero",
        child: Image.asset(
          "assets/images/stylac2.png",
          height: ((MediaQuery.of(context).size.height * 0.4) / 7.6) *
              SizeConfig.heightMultiplier,
        ),
      ),
    );
  }

  Widget signUpForm() {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
          SizeConfig.widthMultiplier,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: (30 / 7.6) * SizeConfig.heightMultiplier,
                color: Color.fromRGBO(255, 175, 190, 1)),
          ),
          SizedBox(
            height: (10 / 7.6) * SizeConfig.heightMultiplier,
          ),
          Container(
              child: Text(
            "We just need your registration email ID to send you reset link.",
            style: TextStyle(
                fontSize: (12 / 7.6) * SizeConfig.heightMultiplier,
                color: Colors.grey),
          )),
          SizedBox(
            height: (20 / 7.6) * SizeConfig.heightMultiplier,
          ),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Field is required!";
                    } else if (!val.contains("@gmail.com")) {
                      return "Invalid Email!!";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: (40 / 7.6) * SizeConfig.heightMultiplier,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          elevation: 0.0,
                          color: Color.fromRGBO(255, 175, 190, 1),
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (19 / 7.6) * SizeConfig.textMultiplier),
                          ),
                          onPressed: formSubmit),
                    ),
                  ],
                ),
                SizedBox(
                  height: (15 / 7.6) * SizeConfig.heightMultiplier,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't Have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.pink),
                      ),
                    )
                  ],
                ),
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? SizedBox(
                        height: 0.0,
                        width: 0.0,
                      )
                    : SizedBox(
                        height: (20 / 7.6) * SizeConfig.heightMultiplier,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  formSubmit() {
    if (formKey.currentState.validate()) {
      // Navigator.of(context).push(PageTransition(
      //     child: WelcomeScreen(),
      //     type: PageTransitionType.fade,
      //     duration: Duration(milliseconds: 700)));
    }
  }
}
