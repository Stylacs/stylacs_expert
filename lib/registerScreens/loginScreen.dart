import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'mobileNumber.dart';
import 'signUp.dart';
import 'package:stylacs_expert/services/google.dart';
import 'package:stylacs_expert/size_config.dart';
import 'package:stylacs_expert/welcomeScreens/HomePages/home.dart';

import 'forgotpassword.dart';

var themeColor = Color.fromRGBO(255, 175, 190, 1);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;
  bool isAuth = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  initState(){
    googleSignIn.onCurrentUserChanged.listen((currentAccount){
      handleGoogleSignIn(currentAccount);
    });
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleGoogleSignIn(account);
    }).catchError((error) {
      print("error if sign in $error");
    });
    super.initState();
  }
  handleGoogleSignIn(GoogleSignInAccount account){
    if(account!=null){
      setState(() {
        isAuth=true;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );
        setState(() {

        });
      });
    }
    else{
      setState(() {
        isAuth=false;
      });
    }
  }
  loginSubmit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email.text, password: password.text).then((user){
        print(user.user.email);
      });
      Navigator.of(context).push(PageTransition(
          child: Home(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 700)));
    }
  }
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
                signUpForm(),
                authSection(),
                mobileNumberForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget portraitHeader() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Hero(
            tag: "image_hero",
            child: Image.asset(
              "assets/images/stylac.png",
              height: ((MediaQuery.of(context).size.height * 0.35) / 7.6) *
                  SizeConfig.heightMultiplier,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        // Text(
        //   "Expert Beautician at your Home",
        //   style: TextStyle(
        //       fontSize: (20 / 7.6) * SizeConfig.textMultiplier,
        //       color: Colors.black),
        // )
      ],
    );
  }

  Widget landscapHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Hero(
            tag: "image_hero",
            child: Image.asset(
              "assets/images/stylac.png",
              height: ((MediaQuery.of(context).size.height * 0.4) / 7.6) *
                  SizeConfig.heightMultiplier,
            ),
          ),
        ),
        Text(
          "Expert Beautician at your Home",
          style: TextStyle(
              fontSize: (20 / 7.6) * SizeConfig.textMultiplier,
              color: Colors.black),
        )
      ],
    );
  }

  Widget signUpForm() {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
          SizeConfig.widthMultiplier,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: email,
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
                  border: UnderlineInputBorder()),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    controller: password,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Field is required!";
                      } else if (val.length < 4) {
                        return "Too Short password!!";
                      } else {
                        return null;
                      }
                    },
                    obscureText: hidePass,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder()),
                  ),
                ),
                Expanded(
                    child: IconButton(
                        icon: FaIcon(
                          hidePass
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: (19 / 7.6) * SizeConfig.heightMultiplier,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        }))
              ],
            ),
            SizedBox(
              height: (10 / 7.6) * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.pink),
                  ),
                )
              ],
            ),
            SizedBox(
              height: (30 / 7.6) * SizeConfig.heightMultiplier,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      elevation: 0.0,
                      color: Color.fromRGBO(255, 175, 190, 1),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (19 / 7.6) * SizeConfig.textMultiplier),
                      ),
                      onPressed: loginSubmit),
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
    );
  }

  formSubmit() {
    if (formKey.currentState.validate()) {
      Navigator.of(context).push(PageTransition(
          child: Home(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 700)));
    }
  }

  Widget authSection() {
    return Padding(
      padding: EdgeInsets.only(top: (40 / 7.6) * SizeConfig.heightMultiplier),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Hero(
                  tag: "facebook",
                  child: Container(
                    alignment: Alignment.center,
                    width: (100 / 3.6) * SizeConfig.widthMultiplier,
                    height: (40 / 7.6) * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            (5 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: (1 / 3.6) * SizeConfig.widthMultiplier),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Color.fromRGBO(59, 89, 152, 1),
                      size: (25 / 7.6) * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  signInWithGoogle().then((user) {
                    if(user.displayName!=null){
                      print("google authenic ${user.displayName}");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                      setState(() {

                      });
                    }

                    else{
                      print("something gone wrong");
                    }

                  });
                },
                child: Hero(
                  tag: "gmail",
                  child: Container(
                    alignment: Alignment.center,
                    width: (100 / 3.6) * SizeConfig.widthMultiplier,
                    height: (40 / 7.6) * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            (5 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: (1 / 3.6) * SizeConfig.widthMultiplier),
                    ),
                    child: Image.asset(
                      "assets/images/gmail.png",
                      height: (25 / 7.6) * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (20 / 7.6) * SizeConfig.heightMultiplier,
          ),
          Container(
            width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
                SizeConfig.widthMultiplier,
            child: Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Container(
                  alignment: Alignment.center,
                  width: (35 / 3.6) * SizeConfig.widthMultiplier,
                  height: (25 / 7.6) * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(
                          (40 / 7.6) * SizeConfig.heightMultiplier))),
                  child: Text(
                    "or",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
          ),
          SizedBox(
            height: (20 / 7.6) * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }

  Widget mobileNumberForm() {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
          SizeConfig.widthMultiplier,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.of(context).push(
              PageTransition(
                  child: MobileNumber(),
                  type: PageTransitionType.fade,
                  duration: Duration(seconds: 1)),
            ),
            child: Container(
              width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
                  SizeConfig.widthMultiplier,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: (16 / 7.6) * SizeConfig.textMultiplier),
                  ),
                  Divider(
                    thickness: (1.0 / 7.6) * SizeConfig.heightMultiplier,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: (5 / 7.6) * SizeConfig.heightMultiplier,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    elevation: 0.0,
                    color: Color.fromRGBO(255, 175, 190, 1),
                    child: Text(
                      "Let's Start",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (19 / 7.6) * SizeConfig.textMultiplier),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: MobileNumber(),
                            type: PageTransitionType.fade,
                            duration: Duration(seconds: 1)),
                      );
                    }),
              ),
            ],
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? SizedBox(
                  height: 0.0,
                  width: 0.0,
                )
              : SizedBox(
                  height: (20 / 7.6) * SizeConfig.heightMultiplier,
                )
        ],
      ),
    );
  }
}
