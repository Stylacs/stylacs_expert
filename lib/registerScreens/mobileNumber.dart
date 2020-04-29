

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylacs_expert/registerScreens/verifyAndOTP.dart';
import 'package:stylacs_expert/size_config.dart';

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final formKey = GlobalKey<FormState>();

  String contactNumber;
  String dialCode = "+92";
  String smsVerificationCode;
  String verificationId;

  Future<void>verifyNumber(String phoneNumber)async{
    final PhoneVerificationCompleted verificationCompleted=
        (AuthCredential authCredential){
    };
    final PhoneVerificationFailed verificationFailed=(AuthException exception){
      print("error ${exception.message}");
    };
    final PhoneCodeSent smsCodeSent=(String verId,[int forceResend]){
      this.verificationId=verId;
      Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyAndOTP(verificationId: verificationId,)));
    };
    final PhoneCodeAutoRetrievalTimeout timeOut=(String verId){
      this.verificationId=verId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: dialCode+phoneNumber,
        timeout: const Duration(seconds: 20),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: timeOut);
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
                authSection(),
                mobileNumberForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget countryCode() {
    return CountryCodePicker(
      onChanged: (code) {
        setState(() {
          dialCode = code.dialCode;
        });
      },

      flagWidth: (18 / 3.6) * SizeConfig.widthMultiplier,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: '+92',
      favorite: ['+92', 'PK'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: true,
      // padding: EdgeInsets.only(top: 25),
      textStyle: TextStyle(fontSize: (10 / 7.6) * SizeConfig.textMultiplier),
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

  Widget authSection() {
    return Padding(
      padding: EdgeInsets.only(top: (50 / 7.6) * SizeConfig.heightMultiplier),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
//............small rectangular containers....................
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: (10 / 7.6) * SizeConfig.heightMultiplier,
                  horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
              width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
                  SizeConfig.widthMultiplier,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.grey[300])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Hero(
                    tag: "facebook",
                    child: Container(
                      width: (10 / 3.6) * SizeConfig.widthMultiplier,
                      height: (15 / 7.6) * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue[900],
                              style: BorderStyle.solid,
                              width: (2 / 3.6) * SizeConfig.widthMultiplier)),
                    ),
                  ),
                  Hero(
                    tag: "gmail",
                    child: Container(
                      width: (10 / 3.6) * SizeConfig.widthMultiplier,
                      height: (15 / 7.6) * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xfff44336).withOpacity(0.8),
                              style: BorderStyle.solid,
                              width: (2 / 3.6) * SizeConfig.widthMultiplier)),
                    ),
                  ),
                ],
              ),
            ),
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
        ],
      ),
    );
  }

  Widget mobileNumberForm() {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.8) / 3.6) *
          SizeConfig.widthMultiplier,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                          style: BorderStyle.solid))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(flex: 2, child: countryCode()),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        setState(() {
                          this.contactNumber=value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Plz Enter Your Mobile Number!!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(color: Colors.black),
                          hoverColor: Colors.teal[300]),
                    ),
                  ),
                  Expanded(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                ],
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
                        "Verify",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (19 / 7.6) * SizeConfig.textMultiplier),
                      ),
                      onPressed: (){
                        verifyNumber(contactNumber);
//                        print(phoneNumController.toString());
//                        _verifyPhoneNumber(context);
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
      ),
    );
  }

}
