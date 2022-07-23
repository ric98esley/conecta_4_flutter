import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:conecta_4/controllers/boar-controler.dart';
import 'package:conecta_4/widgets/boar-table.dart';

class BoarGame extends StatefulWidget {
  @override
  State<BoarGame> createState() => _BoarGameState();
}

class _BoarGameState extends State<BoarGame> {
  @override
  Widget build(BuildContext context) {
    final boarControler = Provider.of<BoarControler>(context);

    return Scaffold(
      appBar: AppBar(
        title:
            boarControler.player ? Text("Juega Amarillo") : Text("Juega Rojo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Center(child: BoarTable()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          boarControler.resetGame();
          setState(() {});
        },
        child: Icon(Icons.restart_alt),
      ),
    );
  }
}
