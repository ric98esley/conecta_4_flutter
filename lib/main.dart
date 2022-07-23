import 'package:conecta_4/controllers/boar-controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:conecta_4/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BoarControler(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Conecta 4',
          initialRoute: 'inicio',
          routes: appRoutes),
    );
  }
}
