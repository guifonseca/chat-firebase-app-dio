enum SalaEnum {
  amizade(salaId: 1, nome: "Amizade"),
  diversos(salaId: 2, nome: "Diversos"),
  esporte(salaId: 3, nome: "Esporte"),
  namoro(salaId: 4, nome: "Namoro"),
  religiao(salaId: 5, nome: "Religião"),
  sexo(salaId: 6, nome: "Sexo (18+)");

  const SalaEnum({
    required this.salaId,
    required this.nome,
  });

  final int salaId;
  final String nome;
}
