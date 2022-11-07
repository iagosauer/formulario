class Utils {
  Utils();

  String ConverteDataStringParaDate(String data) {
    String retorno;
    String dia = data[0] + data[1];
    String mes = data[3] + data[4];
    String ano = data[6] + data[7] + data[8] + data[9];
    try {
      retorno = '${ano}-${mes}-${dia}';
    } catch (e) {
      throw Exception(e);
    }

    return retorno;
  }
}
