import 'package:conecta_4/widgets/cell.dart';
import 'package:flutter/material.dart';

enum Played { Yellow, Red, Empty }

class BoarControler with ChangeNotifier {
  List<List<int>> _boarTableGame = [
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
  ];
  get boarTableGame => _boarTableGame;
  bool start = true;

  bool player = true;

  Played? _playerGo;

  //Cambia de jugador
  void play() {
    (player) ? _playerGo = Played.Yellow : _playerGo = Played.Red;
    player = !player;
    notifyListeners();
  }

  void resetGame() {
    _boarTableGame =
        List.generate(7, (index) => List.generate(6, (index) => 0));
    player = start;
  }

  void addToken(int column, context) {
    int indexModificar =
        _boarTableGame[column].indexWhere((token) => token == 0);

    //Muestra SnackBar que la columna esta llena
    if (indexModificar < 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Columna llena"),
        duration: Duration(milliseconds: 300),
      ));
      return;
    }
    play();
    // Modifica la tabla de acuerdo al jugador
    if (_playerGo == Played.Yellow) _boarTableGame[column][indexModificar] = 2;
    if (_playerGo == Played.Red) _boarTableGame[column][indexModificar] = 1;
  }

  bool checkWin() {
    return checkColumn() || checkRow() || checkDiagonal();
  }

  bool checkColumn() {
    int countRed = 0;
    int countYellow = 0;
    bool win = false;
    for (List column in _boarTableGame) {
      for (var cell in column) {
        if (countRed >= 4 || countYellow >= 4) {
          start = !start;
          win = true;
          resetGame();
        }
        if (cell == 0) {
          countRed = 0;
          countYellow = 0;
        }
        if (cell == 1) {
          countRed++;
          countYellow = 0;
        }
        if (cell == 2) {
          countRed = 0;
          countYellow++;
        }
      }
    }
    return win;
  }

  bool checkRow() {
    int countRed = 0;
    int countYellow = 0;
    bool win = false;
    for (int i = 0; i < 6; i++) {
      for (var column in _boarTableGame) {
        int cell = column[i];
        if (countRed >= 4 || countYellow >= 4) {
          start = !start;
          win = true;
          resetGame();
        }
        if (cell == 0) {
          countRed = 0;
          countYellow = 0;
        }
        if (cell == 1) {
          countRed++;
          countYellow = 0;
        }
        if (cell == 2) {
          countRed = 0;
          countYellow++;
        }
      }
    }
    return win;
  }

  bool checkDiagonal() {
    int countRed = 0;
    int countYellow = 0;
    bool win = false;
    for (int i = 0; i < 6; i++) {
      int j = 0;
      for (var column in _boarTableGame) {
        int cell = column[j];
        j++;
        if (j >= 6) {
          print("no puede");
          j = 0;
        }
        if (countRed >= 4 || countYellow >= 4) {
          start = !start;
          win = true;
          resetGame();
        }
        if (cell == 0) {
          countRed = 0;
          countYellow = 0;
        }
        if (cell == 1) {
          countRed++;
          countYellow = 0;
        }
        if (cell == 2) {
          countRed = 0;
          countYellow++;
        }
      }
    }
    return win;
  }
}
