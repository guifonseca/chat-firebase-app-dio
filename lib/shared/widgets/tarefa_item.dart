import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseappdio/models/tarefa_model.dart';
import 'package:flutter/material.dart';

class TarefaItem extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final String tarefaId;
  final TarefaModel tarefaModel;

  TarefaItem({super.key, required this.tarefaId, required this.tarefaModel});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) async {
        await db.collection("tarefas").doc(tarefaId).delete();
      },
      key: Key(tarefaId),
      child: ListTile(
        title: Text(tarefaModel.descricao),
        trailing: Switch(
          onChanged: (value) async {
            tarefaModel.concluido = value;
            tarefaModel.dtAlteracao = DateTime.now();
            await db
                .collection("tarefas")
                .doc(tarefaId)
                .update(tarefaModel.toJson());
          },
          value: tarefaModel.concluido,
        ),
      ),
    );
  }
}
