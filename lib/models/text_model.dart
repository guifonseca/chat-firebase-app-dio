import 'package:cloud_firestore/cloud_firestore.dart';

class TextModel {
  DateTime dataHora = DateTime.now();
  String text = "";
  String userId = "";
  String nickname = "";
  int salaId = 0;

  TextModel(
      {required this.text,
      required this.userId,
      required this.nickname,
      required this.salaId});

  TextModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['data_hora'] as Timestamp).toDate();
    text = json['text'];
    userId = json['user_id'];
    nickname = json['nickname'];
    salaId = json['sala_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_hora'] = Timestamp.fromDate(dataHora);
    data['text'] = text;
    data['user_id'] = userId;
    data['nickname'] = nickname;
    data['sala_id'] = salaId;
    return data;
  }
}
