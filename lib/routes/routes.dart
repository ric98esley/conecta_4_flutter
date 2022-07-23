import 'package:conecta_4/pages/inicio.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes =
    <String, WidgetBuilder>{'inicio': (_) => Inicio()};
