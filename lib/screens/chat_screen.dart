// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final _scrollController = ScrollController();

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  String messageText = '';

  final _textEditingController = TextEditingController();

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void dataStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              dataStream();
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataStream(firestore: _firestore, loggedInUser: loggedInUser),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Type your message here ...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 2),
                      child: IconButton(
                        onPressed: () async {
                          _firestore.collection('messages').add({
                            'sender': loggedInUser.email,
                            'text': messageText,
                            'timestamp': FieldValue.serverTimestamp(),
                          });
                          setState(() {
                            _textEditingController.clear();
                          });
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          SchedulerBinding.instance?.addPostFrameCallback((_) {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.fastOutSlowIn);
                          });
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataStream extends StatelessWidget {
  const DataStream({
    Key? key,
    required FirebaseFirestore firestore,
    required this.loggedInUser,
  })  : _firestore = firestore,
        super(key: key);

  final FirebaseFirestore _firestore;
  final User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: LinearProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
          );
        }
        final messages = snapshot.data!.docs;

        List<MessageBox> messageBoxs = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final currentUser = loggedInUser.email;

          if (currentUser == messageSender) {
            final messageWidget = MessageBox(
              sender: messageSender,
              text: messageText,
              color: Colors.green,
              crossAxisAlignment: CrossAxisAlignment.end,
              topleft: 25.0,
              topRight: 0.0,
            );
            messageBoxs.add(messageWidget);
          } else {
            final messageWidget = MessageBox(
              sender: messageSender,
              text: messageText,
              color: Colors.red,
              crossAxisAlignment: CrossAxisAlignment.start,
              topleft: 0.0,
              topRight: 25.0,
            );
            messageBoxs.add(messageWidget);
          }
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            children: messageBoxs,
            controller: _scrollController,
          ),
        );
      },
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox(
      {required this.sender,
      required this.text,
      required this.color,
      required this.crossAxisAlignment,
      required this.topleft,
      required this.topRight});

  final String text;
  final String sender;
  final Color color;
  final CrossAxisAlignment crossAxisAlignment;
  final double topleft;
  final double topRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topleft),
              topRight: Radius.circular(topRight),
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
            ),
            elevation: 7.5,
            shadowColor: color,
            color: color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                text,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            sender,
            style: const TextStyle(
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
