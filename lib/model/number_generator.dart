import 'dart:math';

class NumberGenerator {
  int? _firstNum;
  int? _secondNum;

  final List<int> _list = [0, 0];
  final Random _random = Random();

  int _correctCounter = 0;
  int _incorrectCounter = 0;

  int get correctScore => _correctCounter;
  int get incorrectScore => _incorrectCounter;

  int _generateRandomNumber() {
    int min = 1;
    int max = 100;
    return min + _random.nextInt(max - min);
  }

  List<int> get getNumbers => _getRandomNumbers();

  List<int> _getRandomNumbers() {
    // get random number until both numbers are equal
    do {
      _firstNum = _generateRandomNumber();
      _secondNum = _generateRandomNumber();
    } while (_firstNum == _secondNum);

    _list[0] = _firstNum!;
    _list[1] = _secondNum!;
    return _list;
  }

  void checkUserAnswer({required int userAnswer}) =>
      userAnswer == _correctAnswer() ? _correctCounter++ : _incorrectCounter++;

// return correct answer
  int _correctAnswer() => _firstNum! > _secondNum! ? _firstNum! : _secondNum!;

  void resetResult() {
    _correctCounter = 0;
    _incorrectCounter = 0;
  }
}
