import 'package:conecta_4/controllers/boar-controler.dart';
import 'package:flutter/material.dart';
import 'package:conecta_4/widgets/boar-game.dart';

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BoarGame();
  }
}
