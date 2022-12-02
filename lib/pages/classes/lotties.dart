import 'package:lottie/lottie.dart';

class Lotties {
  static erroInternet() {
    return Lottie.asset(
      'lotties/78038-internet-error.json',
      height: 100,
      width: 100,
      repeat: false,
    );
  }

    static report() {
    return Lottie.asset(
      'lotties/85408-clip-board.json',
      height: 70,
      width: 70,
      repeat: false,
    );
  }

  static aminalLoading() {
    return Lottie.asset(
      'lotties/animalLoading.json',
      height: 100,
      width: 100,
    );
  }

  loading() {
    return Lottie.asset(
      'lotties/83125-loading-check.json',
      height: 100,
      width: 100,
    );
  }
}