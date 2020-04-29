import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../size_config.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();

  var image;
  bool isEdit = false;
  bool readOnlyTextField = true;
  // String dob;
  // String gender;
  // DateTime _dob;

  @override
  void initState() {
    super.initState();

    setState(() {
      name.text = "Umi Hani";
      username.text = "Umi_Hani@123";
      phone.text = "091223344";
      gender.text = "Female";
      language.text = "Urdu/English";
      location.text = "Peshawar,Pakistan";
      dob.text = "2/4/1997";
    });
  }

  @override
  Widget build(BuildContext context) {
    var orentaion = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        appBar: isEdit
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                // leading: IconButton(
                //     icon: Icon(
                //       LineIcons.close,
                //       size: (30 / 7.6) * SizeConfig.heightMultiplier,
                //       color: Colors.red,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         isEdit = false;
                //         readOnlyTextField = true;
                //         image = null;
                //       });
                //     }),
                leading: Text(""),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        LineIcons.check,
                        size: (30 / 7.6) * SizeConfig.heightMultiplier,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          isEdit = false;
                          readOnlyTextField = true;
                          // image = null;
                        });
                      })
                ],
              )
            : AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: (25 / 7.6) * SizeConfig.heightMultiplier,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
        backgroundColor: Colors.white,
        body: orentaion == Orientation.portrait
            ? portraitScreen()
            : landscapScreen(),
      ),
    );
  }

  Widget portraitScreen() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
//avatar....................
              glowAvatar(),
//bottom content.................
              bottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget landscapScreen() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
//top section starts here.............
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  glowAvatar(),
//edit button............
                  isEdit
                      ? SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : editButton()
                ],
              ),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),

//user personal info.............
              bottomSection(),
              SizedBox(
                height: (20 / 7.6) * SizeConfig.heightMultiplier,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSection() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? (10 / 7.6) * SizeConfig.heightMultiplier
                        : 0,
              ),
//user personal info..........
              textField(name, Icons.person, TextInputType.text),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),
              textField(
                  username, Icons.alternate_email, TextInputType.emailAddress),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),
              textField(phone, Icons.phone_android, TextInputType.phone),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),

              genderDropDown(),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),

              textField(
                  dob, FontAwesomeIcons.birthdayCake, TextInputType.datetime),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),

              textField(language, Icons.language, TextInputType.text),
              SizedBox(
                height: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),

              textField(location, Icons.location_on, TextInputType.text),

              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? (40 / 7.6) * SizeConfig.heightMultiplier
                        : 0,
              ),
              MediaQuery.of(context).orientation == Orientation.portrait &&
                      isEdit == false
                  ? editButton()
                  : SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
        ),
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
                backgroundImage: image != null
                    ? FileImage(image)
                    : AssetImage('assets/images/flutter.jpg'),
                backgroundColor: Colors.grey[100],
                radius: (animation / 7.6) * SizeConfig.heightMultiplier,
                child: isEdit
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              color: Theme.of(context).primaryColor,
                              size: 25,
                            ),
                            onPressed: () {
                              getImage();
                            }),
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      ),
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

  Widget textField(controller, icon, keyBoardType) {
    return Container(
      padding: EdgeInsets.only(
          top: (1 / 7.6) * SizeConfig.heightMultiplier,
          bottom: (1 / 7.6) * SizeConfig.heightMultiplier,
          right: (10 / 3.6) * SizeConfig.widthMultiplier),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 2.5,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0.0, 0.0),
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular((30 / 7.6) * SizeConfig.heightMultiplier),
          )),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isEdit ? Colors.black : Colors.grey,
            fontSize: (16 / 7.6) * SizeConfig.heightMultiplier),
        readOnly: readOnlyTextField,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: isEdit ? Theme.of(context).primaryColor : Colors.grey,
              size: (25 / 7.6) * SizeConfig.heightMultiplier,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget editButton() {
    return Container(
      child: FlatButton.icon(
        onPressed: () {
          setState(() {
            isEdit = true;
            readOnlyTextField = false;
          });
        },
        padding: EdgeInsets.symmetric(
            vertical: (10 / 7.6) * SizeConfig.heightMultiplier,
            horizontal: (30 / 3.6) * SizeConfig.widthMultiplier),
        icon: Icon(
          Icons.edit,
          color: Colors.white,
          size: (25 / 7.6) * SizeConfig.heightMultiplier,
        ),
        label: Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.white,
              fontSize: (20 / 7.6) * SizeConfig.heightMultiplier),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular((8 / 7.6) * SizeConfig.heightMultiplier),
        )),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget genderDropDown() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (10 / 3.6) * SizeConfig.widthMultiplier,
          vertical: (1 / 7.6) * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 2.5,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0.0, 0.0),
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular((30 / 7.6) * SizeConfig.heightMultiplier),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.transgenderAlt,
            color: isEdit ? Theme.of(context).primaryColor : Colors.grey,
            size: (25 / 7.6) * SizeConfig.heightMultiplier,
          ),
          isEdit
              ? DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        gender.text = val;
                      });
                      print(val);
                    },
                    value: gender.text,
                  ),
                )
              : Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: gender,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isEdit ? Colors.black : Colors.grey,
                        fontSize: (16 / 7.6) * SizeConfig.heightMultiplier),
                    readOnly: readOnlyTextField,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )
        ],
      ),
    );
  }

  getImage() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = _image;
    });
  }
}

// Widget dobField(icon) {
//   return InkWell(
//     onTap: isEdit
//         ? () async {
//             _dob = await Navigator.of(context).push(
//               PageTransition(
//                 child: Datedob(),
//                 type: PageTransitionType.fade,
//                 duration: Duration(milliseconds: 600),
//               ),
//             );
//             setState(() {
//               dob = "${_dob.day}/${_dob.month}/${_dob.year}";
//             });
//           }
//         : () {},
//     child: Container(
//       padding: EdgeInsets.symmetric(
//           vertical: (12 / 7.6) * SizeConfig.heightMultiplier,
//           horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//               blurRadius: 2.5,
//               color: Colors.black.withOpacity(0.3),
//               offset: Offset(0.0, 0.0),
//               spreadRadius: 0.0)
//         ],
//         borderRadius: BorderRadius.all(
//           Radius.circular((30 / 7.6) * SizeConfig.heightMultiplier),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Icon(
//             icon,
//             color: isEdit ? Theme.of(context).primaryColor : Colors.grey,
//             size: (25 / 7.6) * SizeConfig.heightMultiplier,
//           ),
//           Text(
//             dob,
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: isEdit ? Colors.black : Colors.grey,
//                 fontSize: (16 / 7.6) * SizeConfig.heightMultiplier),
//           )
//         ],
//       ),
//     ),
//   );
// }
