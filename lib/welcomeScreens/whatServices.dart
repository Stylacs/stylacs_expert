import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stylacs_expert/welcomeScreens/HomePages/home.dart';

import '../size_config.dart';

class WhatServices extends StatefulWidget {
  final List<String> selectedType;

  const WhatServices({Key key, this.selectedType}) : super(key: key);

  @override
  _WhatServicesState createState() => _WhatServicesState();
}

class _WhatServicesState extends State<WhatServices> {
  TextEditingController serviceName = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<List> services = [];
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
                Text("What Services You Offer?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: (30 / 7.6) * SizeConfig.heightMultiplier)),
                SizedBox(
                  height: (50 / 7.6) * SizeConfig.heightMultiplier,
                ),
                addServicesButton(),
                listOfServices()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget addServicesButton() {
    return Container(
      child: FlatButton.icon(
        onPressed: () {
          dailogBox();
        },
        padding: EdgeInsets.symmetric(
            vertical: (10 / 7.6) * SizeConfig.heightMultiplier,
            horizontal: (30 / 3.6) * SizeConfig.widthMultiplier),
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: (20 / 7.6) * SizeConfig.heightMultiplier,
        ),
        label: Text(
          "Add Services",
          style: TextStyle(
              color: Colors.white,
              fontSize: (18 / 7.6) * SizeConfig.heightMultiplier),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular((8 / 7.6) * SizeConfig.heightMultiplier),
        )),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  dailogBox() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((10 / 7.6) * SizeConfig.heightMultiplier),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      setState(() {
                        services.add([serviceName.text, servicePrice.text]);
                      });
                      Navigator.of(context).pop();
                      serviceName.clear();
                      servicePrice.clear();
                    }
                    print(services);
                  },
                  child: Text("Add")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
            content: Container(
              height: (200 / 7.6) * SizeConfig.heightMultiplier,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      controller: serviceName,
                      decoration: InputDecoration(
                        hintText: "Service Name",
                        hintStyle: TextStyle(
                            fontSize: (17 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Name is required!!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: servicePrice,
                      decoration: InputDecoration(
                        hintText: "Service Price",
                        hintStyle: TextStyle(
                            fontSize: (17 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Name is required!!";
                        } else {
                          return null;
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget listOfServices() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (375/7.6) * SizeConfig.heightMultiplier,
      child: ListView.builder(
        itemCount: services.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(services[i][0]),
            subtitle: Text("RS: ${services[i][1]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    editService(i);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: (25 / 7.6) * SizeConfig.heightMultiplier,
                  ),
                ),
                SizedBox(
                  width: (10 / 7.6) * SizeConfig.heightMultiplier,
                ),
                InkWell(
                  onTap: () {
                    deleteService(i);
                  },
                  child: Icon(Icons.delete,
                      color: Colors.red,
                      size: (25 / 7.6) * SizeConfig.heightMultiplier),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bottomNav() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 3.6) * SizeConfig.widthMultiplier),
      width: MediaQuery.of(context).size.width,
      height: (70 / 7.6) * SizeConfig.heightMultiplier,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Color.fromRGBO(255, 175, 190, 1),
              size: (45 / 7.6) * SizeConfig.heightMultiplier,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowRight,
              color: Color.fromRGBO(255, 175, 190, 1),
              size: (45 / 7.6) * SizeConfig.heightMultiplier,
            ),
            onPressed: () {
              if (services.isNotEmpty) {
                Navigator.of(context).push(PageTransition(
                    child: Home(
                      selectedType: widget.selectedType,
                      selectedServices: services,
                    ),
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.rightToLeftWithFade));
              } else {
                Fluttertoast.showToast(
                    msg: "Plz Add Services!!",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER);
              }
            },
          ),
        ],
      ),
    );
  }

  editService(index) {
    setState(() {
      serviceName.text = services[index][0];
      servicePrice.text = services[index][1];
    });
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((10 / 7.6) * SizeConfig.heightMultiplier),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      setState(() {
                        services.removeAt(index);
                        services.add([serviceName.text, servicePrice.text]);
                      });
                      Navigator.of(context).pop();
                      serviceName.clear();
                      servicePrice.clear();
                    }
                    print(services);
                  },
                  child: Text("Update")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
            content: Container(
              height: (200 / 7.6) * SizeConfig.heightMultiplier,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      controller: serviceName,
                      decoration: InputDecoration(
                        hintText: "Service Name",
                        hintStyle: TextStyle(
                            fontSize: (17 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Name is required!!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: servicePrice,
                      decoration: InputDecoration(
                        hintText: "Service Price",
                        hintStyle: TextStyle(
                            fontSize: (17 / 7.6) * SizeConfig.heightMultiplier),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Name is required!!";
                        } else {
                          return null;
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  deleteService(index) {
    setState(() {
      services.removeAt(index);
      print(services);
    });
  }
}
