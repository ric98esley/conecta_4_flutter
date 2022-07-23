import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:conecta_4/controllers/boar-controler.dart';

class TokenGame extends StatelessWidget {
  final int colorToken;
  const TokenGame({Key? key, required this.colorToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boarControler = Provider.of<BoarControler>(context);
    return Center(
        child: Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: (colorToken == 2)
              ? Colors.yellow
              : (colorToken == 1)
                  ? Colors.red
                  : Colors.white),
    ));
  }
}
