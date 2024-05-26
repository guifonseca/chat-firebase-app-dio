class SalaModel {
  int salaId = 0;
  String nome = "";

  SalaModel({required this.salaId, required this.nome});

  SalaModel.fromJson(Map<String, dynamic> json) {
    salaId = json['sala_id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sala_id'] = salaId;
    data['nome'] = nome;
    return data;
  }
}
