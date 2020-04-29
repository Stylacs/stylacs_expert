import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stylacs_expert/registerScreens/signUp.dart';

import '../size_config.dart';

class VerifyAndOTP extends StatefulWidget {
  final String contactNumber;
  final String dailCode;
  final String verificationId;
  const VerifyAndOTP({Key key, this.contactNumber, this.dailCode, this.verificationId})
      : super(key: key);

  @override
  _VerifyAndOTPState createState() => _VerifyAndOTPState();
}

class _VerifyAndOTPState extends State<VerifyAndOTP> {
  var textOTP;

  signIn(context) async {
    print(textOTP);
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        smsCode: textOTP, verificationId: widget.verificationId);
    await FirebaseAuth.instance.signInWithCredential(credential).then((result) {
      if(result.user.displayName!=null){
        print("hgya ha ");
      }

      Navigator.of(context).push(PageTransition(
          child: SignUp(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 700)));



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
                  height: (100 / 7.6) * SizeConfig.heightMultiplier,
                ),
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
          alignment: Alignment.centerLeft,
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
        Text(
          "Expert Beautician at your Home",
          style: TextStyle(
              fontSize: (20 / 7.6) * SizeConfig.textMultiplier,
              color: Colors.black),
        )
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

  Widget mobileNumberForm() {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
          SizeConfig.widthMultiplier,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "OTP Verification",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: (18 / 7.6) * SizeConfig.textMultiplier),
                ),
                SizedBox(
                  height: (5 / 7.6) * SizeConfig.heightMultiplier,
                ),
                Text(
                  "Enter 6 digit number that send to",
                  style: TextStyle(
                      fontSize: (14 / 7.6) * SizeConfig.textMultiplier),
                ),
                SizedBox(
                  height: (3 / 7.6) * SizeConfig.heightMultiplier,
                ),
                Text(
                  "${widget.dailCode} ${widget.contactNumber}",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: (14 / 7.6) * SizeConfig.textMultiplier),
                ),
              ],
            ),
          ),
          SizedBox(
            height: (50 / 7.6) * SizeConfig.heightMultiplier,
          ),
          PinCodeTextField(
            length: 6,
            onCompleted: (val) {
              textOTP=val;
              signIn(context);
            },
            backgroundColor: Colors.transparent,
            // selectedColor: Color.fromRGBO(255, 175, 190, 1),
            inactiveColor: Color.fromRGBO(255, 175, 190, 1),
            obsecureText: false,
            animationType: AnimationType.fade,
            shape: PinCodeFieldShape.box,
            animationDuration: Duration(milliseconds: 300),
            borderRadius:
            BorderRadius.circular((5 / 7.6) * SizeConfig.heightMultiplier),
            fieldHeight: (40 / 7.6) * SizeConfig.heightMultiplier,
            fieldWidth: (40 / 3.6) * SizeConfig.widthMultiplier,
            onChanged: (value) {
              setState(() {
                textOTP = value;
              });
            },
          ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: RaisedButton(
          //           elevation: 0.0,
          //           color: Color.fromRGBO(255, 175, 190, 1),
          //           child: Text(
          //             "Verify",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: (19 / 7.6) * SizeConfig.textMultiplier),
          //           ),
          //           onPressed: () => formSubmit()),
          //     ),
          //   ],
          // ),
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

  formSubmit() {
    if (textOTP ==widget.verificationId) {

      print("OTP validate");
      print("OTP code: $textOTP");


    }
  }
}
