import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:conecta_4/widgets/cell.dart';

import 'package:conecta_4/controllers/boar-controler.dart';

class ColumnBoar extends StatefulWidget {
  int indexColumn;
  ColumnBoar({Key? key, required this.indexColumn}) : super(key: key);

  @override
  State<ColumnBoar> createState() => _ColumnBoarState();
}

class _ColumnBoarState extends State<ColumnBoar> {
  @override
  Widget build(BuildContext context) {
    final boarControler = Provider.of<BoarControler>(context);
    return GestureDetector(
      onTap: () {
        boarControler.addToken(widget.indexColumn, context);
        bool win = boarControler.checkWin();
        print(win);
        if (win)
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Ganador")));
        setState(() {});
      },
      child: Column(
        children: List.generate(6,
            (index) => Cell(indexRow: 5 - index, indexCol: widget.indexColumn)),
      ),
    );
  }
}
