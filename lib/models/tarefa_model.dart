import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaModel {
  String userId = "";
  String descricao = "";
  bool concluido = false;
  DateTime dtCriacao = DateTime.now();
  DateTime dtAlteracao = DateTime.now();

  TarefaModel(
      {required this.userId, required this.descricao, required this.concluido});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    descricao = json['user_id'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    dtCriacao = (json['dt_criacao'] as Timestamp).toDate();
    dtAlteracao = (json['dt_alteracao'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['dt_criacao'] = Timestamp.fromDate(dtCriacao);
    data['dt_alteracao'] = Timestamp.fromDate(dtAlteracao);
    return data;
  }
}
