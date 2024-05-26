import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseappdio/models/tarefa_model.dart';
import 'package:firebaseappdio/shared/widgets/tarefa_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  bool apenasNaoConcluidos = false;
  String userId = "";

  final db = FirebaseFirestore.instance;

  final TextEditingController descricaoController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    carregarUsuario();
  }

  void carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            final tarefa = TarefaModel(
                                descricao: descricaoController.text,
                                concluido: false,
                                userId: userId);
                            await db.collection("tarefas").add(tarefa.toJson());
                          },
                          child: const Text("Salvar"))
                    ],
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: apenasNaoConcluidos,
                    onChanged: (value) {
                      apenasNaoConcluidos = value;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: apenasNaoConcluidos
                        ? db
                            .collection("tarefas")
                            .where('concluido', isEqualTo: false)
                            .where('user_id', isEqualTo: userId)
                            .snapshots()
                        : db
                            .collection("tarefas")
                            .where('user_id', isEqualTo: userId)
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                          children: snapshot.data!.docs.map((e) {
                        final tarefa = TarefaModel.fromJson(
                            (e.data() as Map<String, dynamic>));
                        return TarefaItem(tarefaId: e.id, tarefaModel: tarefa);
                      }).toList());
                    })),
          ],
        ),
      ),
    );
  }
}
