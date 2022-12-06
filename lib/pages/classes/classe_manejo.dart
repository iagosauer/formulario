
class Manejo {
  Manejo({
    required this.data,
    required this.propriedade,
    required this.pecuaria,
    required this.finalidade,
    required this.tipo,
    required this.motivo,
    required this.idade,
    required this.sexo,
    required this.quantidade,
  });

  //Variável que armazenará a data
  final String data;

  // Variável que armazenará o valor da propriedade escolhida pelo cliente
  final String propriedade;

  // Variável que armazenará o tipo de pecuária escolhida pelo cliente
  final String pecuaria;

  // Variável que armazenará a finalidade escolhida pelo cliente
  final String finalidade;

  // Variável que armazenará o tipo de controle {ENTRADA ou SAÍDA}
  final String tipo;

  // Variável que armazenará o motivo do manejo, exemplo: compra, venda, morte, abate, etc...
  final String motivo;

  // Variável que armazenará a idade em meses
  final int idade;

  // Variável que armazenará a quantidade
  final int quantidade;

  // Variável que armazenará o sexo
  final String sexo;
}
