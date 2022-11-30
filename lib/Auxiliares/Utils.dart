class Utils {
  Utils();

  bool dataValida(String data) {
    try {
      var dia = int.parse('${data[0]}${data[1]}');
      var mes = int.parse('${data[3]}${data[4]}');
      var ano = int.parse('${data[6]}${data[7]}${data[8]}${data[9]}');
      if (!MesValida(mes)) {
        return false;
      }
      if ((dia < 0) || (dia > QtdDiasMes(mes, ano))) {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
    return true;
  }

  bool MesValida(int mes) {
    if (0 < mes && mes < 13) {
      return true;
    }
    return false;
  }

  int QtdDiasMes(int mes, int ano) {
    var diasMeses = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var qtdDias = diasMeses[mes - 1];
    if ((anoBissexto(ano)) && (mes == 2)) {
      qtdDias = 29;
    }
    return qtdDias;
  }

  bool anoBissexto(int ano) {
    return ((ano % 4 == 0) && ((!(ano % 100 == 0)) || (ano % 400 == 0)));
  }

  String ConverteDateParaDataString(String date)
  {
    return date[8]+date[9]+'/'+date[5]+date[6]+'/'+date[0]+date[1]+date[2]+date[3];
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
