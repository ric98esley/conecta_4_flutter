import 'package:conecta_4/widgets/column-board.dart';
import 'package:flutter/material.dart';

class BoarTable extends StatelessWidget {
  const BoarTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          7,
          (index) => ColumnBoar(
                indexColumn: index,
              )),
    );
  }
}
