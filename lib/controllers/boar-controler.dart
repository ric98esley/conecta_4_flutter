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
  int _scoreRed = 0;
  int _scoreYellow = 0;
  set scoreRed(int value) {
    _scoreRed++;
    notifyListeners();
  }

  int get scoreRed => _scoreRed;
  set scoreYellow(int value) {
    _scoreYellow++;
    notifyListeners();
  }

  int get scoreYellow => _scoreYellow;

  bool player = true;

  Played? _playerGo;
  int _indexRow = 0;

  //Cambia de jugador
  void play() {
    (player) ? _playerGo = Played.Yellow : _playerGo = Played.Red;
    player = !player;
    notifyListeners();
  }

  void resetTable() {
    _boarTableGame =
        List.generate(7, (index) => List.generate(6, (index) => 0));
    player = start;
    notifyListeners();
  }

  void resetGame() {
    _scoreRed = 0;
    _scoreYellow = 0;
    start = true;
    resetTable();
  }

  void addToken(int column, context) {
    _indexRow = _boarTableGame[column].indexWhere((token) => token == 0);

    //Muestra SnackBar que la columna esta llena
    if (_indexRow < 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Columna llena"),
        duration: Duration(milliseconds: 300),
      ));
      return;
    }
    play();
    // Modifica la tabla de acuerdo al jugador
    if (_playerGo == Played.Yellow) _boarTableGame[column][_indexRow] = 2;
    if (_playerGo == Played.Red) _boarTableGame[column][_indexRow] = 1;
  }

  bool checkWin({required column}) {
    return checkColumn(column) ||
        checkRow(_indexRow, _boarTableGame) ||
        checkDiagonal(column, _indexRow, _boarTableGame.reversed.toList()) ||
        checkDiagonal(column, _indexRow, _boarTableGame);
  }

  bool checkColumn(int column) {
    int countRed = 0;
    int countYellow = 0;
    bool win = false;

    for (var cell in _boarTableGame[column]) {
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
      if (countRed >= 4 || countYellow >= 4) {
        start = !start;
        win = true;
      }
    }
    return win;
  }

  bool checkRow(int indexR, List<List<int>> board) {
    int countRed = 0;
    int countYellow = 0;
    bool win = false;

    for (var column in board) {
      int cell = column[indexR];
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
      if (countRed >= 4 || countYellow >= 4) {
        start = !start;
        win = true;
      }
    }
    return win;
  }

  bool checkDiagonal(int indexCol, int indexRo, List<List<int>> board) {
    bool win = false;
    List<List<int>> newList = [];
    // Revuelve la primera parte y los agrega para ser leidos
    for (int i = 3; i > 0; i--) {
      List<int> column = board[3 - i].getRange(i, 6).toList();
      List<int> resto = board[3 - i].getRange(0, i).toList();
      column.addAll(resto);
      newList.add(column.toList());
    }
    // Revuelve la segunda parte y agrega al nuevo array y los agrega para ser leidos
    for (int i = 0; i < 4; i++) {
      List<int> column = board[i + 3].getRange(0, 6 - i).toList();
      List<int> resto = board[i + 3].getRange(6 - i, 6).toList();
      column.insertAll(0, resto);
      newList.add(column.toList());
    }
    //Quita los valores que no son relevantes para ser leidos y los sustituye por un 0 asi cuando sean leidos no afectan

    for (int i = 0; i < 3; i++) {
      newList[4 + i].fillRange(0, i + 1, 0);
      newList[i].fillRange(3 + i, 6, 0);
    }
    // Verifica en el nuevo arreglo si hay cuatro en linea con la funcion checkRow
    for (int i = 0; i < 6; i++) {
      //cuando encuentra 4 en linea deja de verificar las siguientes
      if (win == false) win = checkRow(i, newList);
    }

    return win;
  }
}
