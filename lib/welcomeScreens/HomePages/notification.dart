import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:stylacs_expert/size_config.dart';

class Notifiications extends StatefulWidget {
  @override
  _NotifiicationsState createState() => _NotifiicationsState();
}

class _NotifiicationsState extends State<Notifiications> {
  @override
  Widget build(BuildContext context) {
    var orentaion = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: orentaion == Orientation.portrait
            ? portraitScreen()
            : landscapScreen(),
      ),
    );
  }

  Widget portraitScreen() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: (5 / 3.6) * SizeConfig.widthMultiplier),
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                        color: Color.fromRGBO(60, 79, 111, 1),
                        fontSize: (27 / 7.6) * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                glowAvatar()
              ],
            ),
            searchBar(),
//main content here..................
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: (539 / 7.6) * SizeConfig.heightMultiplier,
              child: notificationList(),
            )
//main content ends here...................
          ],
        ),
      ),
    );
  }

  Widget landscapScreen() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: (5 / 3.6) * SizeConfig.widthMultiplier),
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                          color: Color.fromRGBO(60, 79, 111, 1),
                          fontSize: (27 / 7.6) * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  searchBar(),
                  glowAvatar()
                ],
              ),
            ),
//main content here..................
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: (390 / 7.6) * SizeConfig.heightMultiplier,
              child: notificationList(),
            )
//main content ends here...................
          ],
        ),
      ),
    );
  }

  Widget glowAvatar() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 700),
      curve: Curves.fastLinearToSlowEaseIn,
      tween: Tween(begin: 0.0, end: 25.0),
      builder: (context, animation) {
        return Hero(
          tag: "profileDP",
          child: AvatarGlow(
            startDelay: Duration(milliseconds: 1000),
            glowColor: Colors.blueGrey,
            endRadius: (45.0 / 7.6) * SizeConfig.heightMultiplier,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              color: Color.fromRGBO(255, 175, 190, 1),
              elevation: 8.0,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(2.0),
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
          ),
        );
      },
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (15 / 3.6) * SizeConfig.widthMultiplier),
      child: Container(
        width: (150/3.6) * SizeConfig.heightMultiplier,
        height: (48 / 7.6) * SizeConfig.heightMultiplier,
        padding: EdgeInsets.symmetric(
            horizontal: (8 / 3.6) * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular((8 / 7.6) * SizeConfig.heightMultiplier),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here...",
                    hintStyle: TextStyle(
                        fontSize: (17 / 7.6) * SizeConfig.heightMultiplier)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: (25 / 7.6) * SizeConfig.heightMultiplier,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget notificationList() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: (20 / 7.6) * SizeConfig.heightMultiplier),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: (5 / 7.6) * SizeConfig.heightMultiplier),
            child: Container(
              margin: contact.unread
                  ? EdgeInsets.only(
                      right: (20 / 3.6) * SizeConfig.widthMultiplier)
                  : EdgeInsets.only(),
              padding: EdgeInsets.symmetric(
                  vertical: (10 / 7.6) * SizeConfig.heightMultiplier),
              decoration: BoxDecoration(
                  color: contact.unread ? Colors.red[100] : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          (20 / 7.6) * SizeConfig.heightMultiplier),
                      bottomRight: Radius.circular(
                          (20 / 7.6) * SizeConfig.heightMultiplier))),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(contact.sender.imageUrl),
                    radius: (30 / 7.6) * SizeConfig.heightMultiplier,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        contact.sender.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (16 / 7.6) * SizeConfig.heightMultiplier,
                            color: Colors.grey),
                      ),
                      Container(
                        width: (180 / 3.6) * SizeConfig.widthMultiplier,
                        child: Text(
                          "commented on your",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: (13 / 7.6) * SizeConfig.heightMultiplier,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: (180 / 3.6) * SizeConfig.widthMultiplier,
                        child: Text(
                          "post: ${contact.text}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: (13 / 7.6) * SizeConfig.heightMultiplier,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        contact.time,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: (14 / 7.6) * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: (10 / 7.6) * SizeConfig.heightMultiplier,
                      ),
                      contact.unread
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      (3 / 7.6) * SizeConfig.heightMultiplier,
                                  horizontal:
                                      (8 / 3.6) * SizeConfig.widthMultiplier),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      (30 / 7.6) *
                                          SizeConfig.heightMultiplier)),
                              child: Text(
                                "new",
                                style: TextStyle(
                                    fontSize: (13 / 7.6) *
                                        SizeConfig.heightMultiplier,
                                    color: Colors.white),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      (3 / 7.6) * SizeConfig.heightMultiplier,
                                  horizontal:
                                      (8 / 3.6) * SizeConfig.widthMultiplier),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      (30 / 7.6) *
                                          SizeConfig.heightMultiplier)),
                              child: Text(""))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

//user model...............
class User {
  int id;
  String name;
  String imageUrl;

  User({this.id, this.name, this.imageUrl});
}

//messages model...............
class Message {
  final User sender;
  String time;
  String text;
  bool isLiked;
  bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final User currentUser =
    User(id: 0, name: "Nusrat Khan", imageUrl: "assets/images/harry.jpg");

final User alisa =
    User(id: 1, name: "Alisa", imageUrl: "assets/images/hair/emma.jpg");
final User harry =
    User(id: 2, name: "Harry", imageUrl: "assets/images/hair/isabella.jpg");
final User jack =
    User(id: 3, name: "Jack Richerd", imageUrl: "assets/images/hair/sophia.jpg");
final User john =
    User(id: 4, name: "John Doe", imageUrl: "assets/images/order/makeup1.jpg");
final User peter =
    User(id: 5, name: "Mr.Peter", imageUrl: "assets/images/order/makeup2.jpg");
final User robben =
    User(id: 6, name: "Robben", imageUrl: "assets/images/order/makeup3.jpg");
final User stefan =
    User(id: 6, name: "Stefan", imageUrl: "assets/images/hair/shampoo.png");

//home screen contacts.....

List<Message> contacts = [
  Message(
      sender: alisa,
      text: "Hello there im Alisa What's your name.",
      time: "8:20 AM",
      unread: true),
  Message(
      sender: jack,
      text: "Hello there im jack What's your name.",
      time: "2:20 PM",
      unread: true),
  Message(
      sender: john,
      text: "Hello there im john What's your name.",
      time: "8:20 AM",
      unread: false),
  Message(
      sender: peter,
      text: "Hello there im Peter What's your name.",
      time: "1:20 PM",
      unread: false),
  Message(
      sender: robben, text: "Hello there!!", time: "8:20 AM", unread: false),
  Message(sender: stefan, text: "Hi.", time: "6:00 AM", unread: true),
  Message(
      sender: alisa,
      text: "Hello there im Alisa What's your name.",
      time: "8:20 AM",
      unread: false),
  Message(
      sender: alisa,
      text: "Hello there im Alisa What's your name.",
      time: "8:20 AM",
      isLiked: false,
      unread: false),
];
