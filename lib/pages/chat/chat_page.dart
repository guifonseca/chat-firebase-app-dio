import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseappdio/models/text_model.dart';
import 'package:firebaseappdio/shared/enums/sala_enum.dart';
import 'package:firebaseappdio/shared/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;
  final SalaEnum sala;

  const ChatPage({super.key, required this.nickName, required this.sala});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;

  final textController = TextEditingController(text: "");

  String userId = "";

  @override
  void initState() {
    super.initState();
    _carregarUsuario();
  }

  void _carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Chat: ${widget.sala.nome}")),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: db
                .collection("chats")
                .where('sala_id', isEqualTo: widget.sala.salaId)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((e) {
                  final textModel =
                      TextModel.fromJson((e.data() as Map<String, dynamic>));
                  return ChatWidget(
                      myMessage: textModel.userId == userId,
                      textModel: textModel);
                }).toList(),
              );
            },
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: textController,
                  style: const TextStyle(fontSize: 18),
                  decoration:
                      const InputDecoration(focusedBorder: InputBorder.none),
                )),
                IconButton(
                    onPressed: () async {
                      final textModel = TextModel(
                          nickname: widget.nickName,
                          text: textController.text,
                          userId: userId,
                          salaId: widget.sala.salaId);
                      await db.collection("chats").add(textModel.toJson());
                      textController.text = "";
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
