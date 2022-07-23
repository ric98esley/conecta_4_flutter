import 'package:conecta_4/controllers/boar-controler.dart';
import 'package:conecta_4/widgets/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cell extends StatelessWidget {
  final int indexRow;
  final int indexCol;
  Cell({Key? key, required this.indexRow, required this.indexCol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boarControler = Provider.of<BoarControler>(context);

    return Container(
        width: 45,
        height: 45,
        color: Colors.blue,
        child: Center(
            child: Container(
          height: 40,
          width: 40,
          child: TokenGame(
            colorToken: boarControler.boarTableGame[indexCol][indexRow],
          ),
        )));
  }
}
