import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebaseappdio/pages/chat/chat_page.dart';
import 'package:firebaseappdio/shared/enums/sala_enum.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(
                int.parse("0xff${remoteConfig.getString("COR_FUNDO_TELA")}")),
            appBar: AppBar(
              title: const Text("Salas de chat"),
            ),
            body: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: SalaEnum.values.length,
                itemBuilder: (bc, index) {
                  final sala = SalaEnum.values[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                        onTap: () {
                          nicknameController.text = "";
                          showDialog(
                            context: context,
                            builder: (bc) => AlertDialog(
                              content: Wrap(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          remoteConfig.getString("TEXTO_CHAT")),
                                      TextField(
                                        controller: nicknameController,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(bc);
                                            Navigator.push(
                                                bc,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage(
                                                          sala: sala,
                                                          nickName:
                                                              nicknameController
                                                                  .text),
                                                ));
                                          },
                                          child: const Text("Entrar no chat"))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        title: Text(sala.nome),
                        trailing: const Icon(Icons.chevron_right_outlined)),
                  );
                })));
  }
}
