 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:page_transition/page_transition.dart';
 import 'package:stylacs_expert/registerScreens/forgotpassword.dart';
 import 'package:stylacs_expert/registerScreens/signUp.dart';
 import 'package:stylacs_expert/welcomeScreens/welcomescreen.dart';
 import '../size_config.dart';

 class SignIn extends StatefulWidget {
   @override
   _SignInState createState() => _SignInState();
 }

 class _SignInState extends State<SignIn> {
   final formKey = GlobalKey<FormState>();
   bool hidePass = true;
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();

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
               height: (10/7.6) * SizeConfig.heightMultiplier,
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
               height: (50 / 7.6) * SizeConfig.heightMultiplier,
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
                         builder: (context) => SignUp()));
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
           child: WelcomeScreen(),
           type: PageTransitionType.fade,
           duration: Duration(milliseconds: 700)));
     }
   }
 }
