import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constants.dart';

class ChatScreen extends StatefulWidget {
  var id;

  ChatScreen(this.id);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  var chatRoomid;
  final TextEditingController chatController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.id != null || widget.id != "") {
      getCounterZero();
    }
    data();
  }

  getCounterZero() async {
    await FirebaseFirestore.instance
        .collection("badge")
        .doc(chatRoomId(widget.id, "123"))
        .collection("id")
        .doc("123")
        .set({"count": 0});
  }

  data() {
    chatRoomId(widget.id, "123");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.25,
                  decoration: const BoxDecoration(
                    color: blueColor,
                  ),
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.07,
                      right: constraints.maxWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  final GoogleSignIn googleSignIn =
                                      GoogleSignIn();
                                  googleSignIn.disconnect();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          //hello
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                SingleChildScrollView(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Quick Chat",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Container(),
                                Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? constraints.maxHeight * 0.5
                        : constraints.maxHeight * 0.80,
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                height:
                                    MediaQuery.of(context).size.height * .78,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: _fireStore
                                        .collection('chatroom')
                                        .doc(chatRoomid)
                                        .collection('chats')
                                        .orderBy("time", descending: true)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.data != null) {
                                        return ListView.builder(
                                            reverse: true,
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              Map<String, dynamic>? map =
                                                  snapshot.data!.docs[index]
                                                          .data()
                                                      as Map<String, dynamic>?;
                                              return checkIsSenderOrReciever(
                                                map,
                                              );
                                            });
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ),
                            ),
                            Container(
                                width: constraints.maxWidth * 0.9,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: blueColor),
                                child: Row(
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * 0.80,
                                      height: 65,
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              constraints.maxWidth * 0.02),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              constraints.maxWidth * 0.05),
                                      child: TextField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: chatController,
                                        decoration: const InputDecoration(
                                            hintText: 'Type Your Message',
                                            border: InputBorder.none,
                                            hintStyle:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          String text =
                                              chatController.text.toString();
                                          chatController.clear();
                                          await onSendMessage(text);
                                        },
                                        child: const Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  checkIsSenderOrReciever(Map<String, dynamic>? map) {
    return Container(
        child: map!['sendby'] == widget.id.toString()
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.55),
                        decoration: BoxDecoration(
                            color: redColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            map['message'],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01),
                        child: Text(
                          convertToAgo(DateTime.fromMillisecondsSinceEpoch(
                              int.parse(map['time']))),
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF8F908F)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.55),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            map['message'],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01),
                        child: Text(
                          convertToAgo(DateTime.fromMillisecondsSinceEpoch(
                              int.parse(map['time']))),
                          style: const TextStyle(
                              fontSize: 8, color: Color(0xFF8F908F)),
                        ),
                      )
                    ],
                  ),
                ],
              ));
  }

  Future<void> onSendMessage(String text) async {
    String lastMessage = text;
    if (text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": widget.id.toString(),
        "message": text,
        "time": DateTime.now().millisecondsSinceEpoch.toString(),
      };

      await _fireStore
          .collection('chatroom')
          .doc(chatRoomid)
          .collection('chats')
          .add(messages);

      var idsList = await _fireStore
          .collection("ChatIds")
          .doc("ids")
          .collection("123")
          .doc("123")
          .get();

      var friendIdsList = await _fireStore
          .collection("ChatIds")
          .doc("ids")
          .collection("123")
          .doc("123")
          .get();

      try {
        if (idsList["list"] != null) {
          List list = idsList["list"];
          List friendList = friendIdsList["list"];
          if (!list.contains(chatRoomid)) {
            list.add(chatRoomid);
          }
          if (!friendList.contains(chatRoomid)) {
            friendList.add(chatRoomid);
          }
          await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection("123")
              .doc("123")
              .set({
            "list": list,
          });
          await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection("123")
              .doc("123")
              .set({
            "list": friendList,
          });
        } else {
          await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection(widget.id.toString())
              .doc(widget.id.toString())
              .set({"list": []});
        }
      } on StateError catch (e) {
        if (e.message == e.message) {
          await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection(widget.id.toString())
              .doc(widget.id.toString())
              .set({"list": []});
          var idsList = await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection(widget.id.toString())
              .doc(widget.id.toString())
              .get();
          if (idsList["list"] != null) {
            List list = idsList["list"];
            List friendList = [];
            if (!list.contains(chatRoomid)) {
              list.add(chatRoomid);
            }
            await _fireStore
                .collection("ChatIds")
                .doc("ids")
                .collection(widget.id.toString())
                .doc(widget.id.toString())
                .set({
              "list": list,
            });
            await _fireStore
                .collection("ChatIds")
                .doc("ids")
                .collection("123")
                .doc("123")
                .set({
              "list": friendList,
            });
          }
        }
      }
    }

    FirebaseFirestore.instance
        .collection("lastMessage")
        .doc(chatRoomid.toString())
        .set({
      "lastMsg": lastMessage,
      "time": DateTime.now().millisecondsSinceEpoch.toString()
    });

    int count = 0;
    try {
      var ids = await FirebaseFirestore.instance
          .collection("badge")
          .doc(chatRoomid.toString())
          .collection("id")
          .doc(widget.id.toString())
          .get();

      count = ids["count"];
      count += 1;
      await FirebaseFirestore.instance
          .collection("badge")
          .doc(chatRoomid.toString())
          .collection("id")
          .doc(widget.id.toString())
          .set({"count": count});
    } on StateError catch (e) {
      count += 1;
      await FirebaseFirestore.instance
          .collection("badge")
          .doc(chatRoomid.toString())
          .collection("id")
          .doc(widget.id.toString())
          .set({"count": count});
    }
  }

  String chatRoomId(var user1, var user2) {
    chatRoomid = '$user1-$user2';
    return chatRoomid;
  }

  status() {
    FirebaseFirestore.instance
        .collection("Status")
        .doc(chatRoomid)
        .collection("id")
        .doc("123")
        .set({"count": 0});
    FirebaseFirestore.instance
        .collection("Status")
        .doc(chatRoomid)
        .collection("id")
        .doc(widget.id.toString())
        .set({"count": 0});
  }
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays > 365) {
    return '${diff.inDays} ${"Years ago"}';
  } else if (diff.inDays >= 30 && diff.inDays < 365) {
    return '${diff.inDays} ${"Months ago"}';
  } else if (diff.inDays >= 1) {
    return '${diff.inDays} ${"Days ago"}';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} ${"hours ago"}';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} ${"minutes ago"}';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} ${"seconds ago"}';
  } else {
    return 'just now';
  }
}
