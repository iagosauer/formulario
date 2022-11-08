class Utils {
  Utils();

  bool isValidDate(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  String ConverteDataStringParaDate(String data) {
    String retorno;
    String dia = data[0] + data[1];
    String mes = data[3] + data[4];
    String ano = data[6] + data[7] + data[8] + data[9];
    try {
      retorno = '${ano}-${mes}-${dia}';
      DateTime.parse(retorno);
    } catch (e) {
      throw Exception(e);
    }

    return retorno;
  }

  String AnoHoje() {
    String retorno;
    retorno = DateTime.now().year.toString();
    return retorno;
  }

  String MesHoje() {
    String retorno;
    int x = DateTime.now().month;
    if (x < 10) {
      retorno = '0' + x.toString();
    } else {
      retorno = x.toString();
    }
    return retorno;
  }

  String DiaHoje() {
    String retorno;
    int x = DateTime.now().day;
    if (x < 10) {
      retorno = '0' + x.toString();
    } else {
      retorno = x.toString();
    }
    return retorno;
  }

  String DataHoje() {
    return ('${DiaHoje()}/${MesHoje()}/${AnoHoje()}');
  }
}
