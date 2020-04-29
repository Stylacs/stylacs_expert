import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stylacs_expert/widget/drawer/drawer.dart';
import '../../size_config.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final scafKey = GlobalKey<ScaffoldState>();
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    // var orentaion = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scafKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: isSearching
            ? searchField()
            : Text(
                "Inbox",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (20 / 7.6) * SizeConfig.heightMultiplier),
              ),
        leading: isSearching
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  size: (25 / 7.6) * SizeConfig.heightMultiplier,
                ),
                onPressed: () {
                  setState(() {
                    isSearching = false;
                  });
                })
            : IconButton(
                icon: Icon(
                  Icons.menu,
                  size: (25 / 7.6) * SizeConfig.heightMultiplier,
                ),
                onPressed: () {
                  scafKey.currentState.openDrawer();
                }),
        actions: <Widget>[
          isSearching
              ? Text("")
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    size: (25 / 7.6) * SizeConfig.heightMultiplier,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  })
        ],
      ),
      drawer: MyDrawer().buildDrawer(context),
      body: isSearching
          ? Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          (30 / 7.6) * SizeConfig.heightMultiplier),
                      topRight: Radius.circular(
                          (30 / 7.6) * SizeConfig.heightMultiplier))),
              child: messages(),
            ),
    );
  }

  Widget messages() {
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
                        width: (150 / 3.6) * SizeConfig.widthMultiplier,
                        child: Text(
                          contact.text,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  (14 / 7.6) * SizeConfig.heightMultiplier,
                              color: Colors.blueGrey),
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

  Widget searchField() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Here...",
          hintStyle:
              TextStyle(fontSize: (18 / 7.6) * SizeConfig.heightMultiplier)),
    );
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
      isLiked: false,
      unread: true),
  Message(
      sender: jack,
      text: "Hello there im jack What's your name.",
      time: "2:20 PM",
      isLiked: false,
      unread: true),
  Message(
      sender: john,
      text: "Hello there im john What's your name.",
      time: "8:20 AM",
      isLiked: false,
      unread: false),
  Message(
      sender: peter,
      text: "Hello there im Peter What's your name.",
      time: "1:20 PM",
      isLiked: false,
      unread: false),
  Message(
      sender: robben,
      text: "Hello there!!",
      time: "8:20 AM",
      isLiked: false,
      unread: false),
  Message(
      sender: stefan,
      text: "Hi.",
      time: "6:00 AM",
      isLiked: false,
      unread: true),
  Message(
      sender: alisa,
      text: "Hello there im Alisa What's your name.",
      time: "8:20 AM",
      isLiked: false,
      unread: false),
  Message(
      sender: alisa,
      text: "Hello there im Alisa What's your name.",
      time: "8:20 AM",
      isLiked: false,
      unread: false),
];
