import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final Stream<QuerySnapshot> _messagesStream = FirebaseFirestore.instance
    .collection('messages')
    .orderBy('timestamp', descending: true)
    .snapshots();

late User loggedInUser;

var currentUser = FirebaseAuth.instance.currentUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const String screenID = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String messageText;

  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(loggedInUser);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('️Chat'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _messagesStream,
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }

                // Dang that was a difficult one
                // took the code from the flutter docs https://firebase.flutter.dev/docs/firestore/usage/#realtime-changes
                // for some reason it could not render
                // ended up switching from ListView to Column
                return Flexible(
                  child: ListView(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 20.0),
                    // Added the map<Widget> because of this doc https://stackoverflow.com/questions/49603021/type-listdynamic-is-not-a-subtype-of-type-listwidget
                    children: snapshot.data!.docs.map<Widget>(
                      (DocumentSnapshot document) {
                        // check more about map
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        // Stopped here, might be on to something
                        final messageSender = data['sender'];
                        return Column(
                          crossAxisAlignment:
                              messageSender == loggedInUser.email
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.0,
                              child: ListTile(
                                title: Text(data['sender']),
                                subtitle: Container(
                                  margin: const EdgeInsets.only(
                                      top: 3.0, bottom: 6.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: messageSender ==
                                              loggedInUser.email
                                          ? Radius.circular(30.0)
                                          : Radius.circular(0.0),
                                      topRight: messageSender ==
                                              loggedInUser.email
                                          ? Radius.circular(0.0)
                                          : Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                    ),
                                    color:
                                        messageSender == loggedInUser.email
                                            ? Colors.blueAccent
                                            : Colors.white,
                                  ),
                                  child: Text(
                                    data['text'] ?? '',
                                    style: TextStyle(
                                      color: messageSender ==
                                              loggedInUser.email
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message here',
                      ),
                      onChanged: (value) {
                        messageText = value;
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _firestore.collection('messages').add({
                      'text': messageText,
                      'sender': loggedInUser.email,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    textController.clear();
                  },
                  child: const Text(
                    'Send',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// void messageStream() async {
//   // Dart Streams
//   // We are "subscribed" to the messages data collection
//   // that way we listen to new messages coming in
//   // new messages will be updates automatically
//   await for(var snapshot in _messagesStream){
//     for(var messages in snapshot.docs){
//       print(messages.data());
//     }
//   }
// }

// final messages = snapshot.data.docs;
// List<Text> messageWidgets = [];
// for (var message in messages) {
//   final messageSender = message.data.docs['sender'];
//   final messageText = message.data.docs['text'];
//   final messageWidget = Text(
//       '$messageText from $messageSender');
//   messageWidgets.add(messageWidget);
// }
// return Column(
//   children: messageWidgets,
// );
