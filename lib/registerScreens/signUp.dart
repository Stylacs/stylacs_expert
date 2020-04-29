import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stylacs_expert/registerScreens/loginScreen.dart';
import '../size_config.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  formSubmit() async{
    if (formKey.currentState.validate()){
      formKey.currentState.save();
      await createFireStoreUser(context);
      Navigator.of(context).push(PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 700)));
    }
  }
  Future<void> createFireStoreUser(context){
    print("Clicked sign Up");
    Firestore.instance.collection("SignUpUserServices").document().setData({
      "name":name.text,
      "email":email.text,
      "password":password.text,
      "phone":phone.text,
    }).then((user)async{
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then(( authResult){
        print(authResult.user.email);
        print("user created");
      });
    });

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
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: name,
              validator: (val) {
                if (val.isEmpty) {
                  return "Field is required!";
                } else if (val.length < 3) {
                  return "Too Short Name!!";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: email,
              validator: (val) {
                if (val.isEmpty) {
                  return "Field is required!";
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
            TextFormField(
              controller: phone,
              validator: (val) {
                if (val.isEmpty) {
                  return "Field is required!";
                } else if (val.length < 11) {
                  return "Invalid number!!";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Phone No.",
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
              height: (40 / 7.6) * SizeConfig.heightMultiplier,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      elevation: 0.0,
                      color: Color.fromRGBO(255, 175, 190, 1),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (19 / 7.6) * SizeConfig.textMultiplier),
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
                  "Already Have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.pink),
                    ))
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

}
