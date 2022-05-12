import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  var chatRoomid;
  final TextEditingController chatController = TextEditingController();
  var id;

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getId();
    if (id != null || id != "") {
      Timer.periodic(const Duration(seconds: 1), (timer) async {
        await getCounterZero();
      });
    }
    data();
  }

  getCounterZero() async {
    await FirebaseFirestore.instance
        .collection("badge")
        .doc(ChatRoomdId(id.toString(), "123"))
        .collection("id")
        .doc("123")
        .set({"count": 0});
  }

  data() async {
    print("Error:::: 1");
    await ChatRoomdId(id.toString(), "123");
    status();
    print("Error:::: 2");
    setState(() {

    });
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
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: blueColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Quick Chat",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(30),
                          topRight: const Radius.circular(30)),
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
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 60,
                                          margin: EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: blueColor),
                                          child: Row(
                                            children: [
                                              Container(
                                                width:
                                                    constraints.maxWidth * 0.85,
                                                height: 65,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  onChanged: (text) {
                                                    chatController.text.isEmpty
                                                        ? FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "Status")
                                                            .doc(chatRoomid)
                                                            .collection("id")
                                                            .doc("123")
                                                            .set({"count": 0})
                                                        : FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "Status")
                                                            .doc(chatRoomid)
                                                            .collection("id")
                                                            .doc("123")
                                                            .set({"count": 1});
                                                  },
                                                  controller: chatController,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'Type Your Message',
                                                    border: InputBorder.none,
                                                        hintStyle: TextStyle(
                                                          color: Colors.white
                                                        )
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () async {
                                                    String text = chatController
                                                        .text
                                                        .toString();

                                                    chatController.clear();
                                                    await onSendMessage(text);
                                                  },
                                                  child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      child: const Icon(Icons.send,color: Colors.white,))),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
        child: map!['sendby'] == id.toString()
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
                            color: redColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            map['message'],
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01),
                        child: Text("${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(map['time'])))}"),
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
                        child: Text("${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(map['time'])))}"),
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
        "sendby": id.toString(),
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
          .collection(id.toString())
          .doc(id.toString())
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
              .collection(id.toString())
              .doc(id.toString())
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
              .collection(id.toString())
              .doc(id.toString())
              .set({"list": []});
        }
      } on StateError catch (e) {
        if (e.message == e.message) {
          await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection(id.toString())
              .doc(id.toString())
              .set({"list": []});
          var idsList = await _fireStore
              .collection("ChatIds")
              .doc("ids")
              .collection(id.toString())
              .doc(id.toString())
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
                .collection(id.toString())
                .doc(id.toString())
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
          .doc(id.toString())
          .get();

      count = ids["count"];
      count += 1;
      await FirebaseFirestore.instance
          .collection("badge")
          .doc(chatRoomid.toString())
          .collection("id")
          .doc(id)
          .set({"count": count});
    } on StateError catch (e) {
      count += 1;
      await FirebaseFirestore.instance
          .collection("badge")
          .doc(chatRoomid.toString())
          .collection("id")
          .doc(id)
          .set({"count": count});
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  String ChatRoomdId(var user1, var user2) {
      chatRoomid = '$user2-$user1';
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
        .doc("123")
        .set({"count": 0});
  }
}
