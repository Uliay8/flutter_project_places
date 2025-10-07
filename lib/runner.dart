import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/app/ui/app.dart';

//здесь можно подключить firebase или отлавливать ошибки
//глобально через runZonedGuarded()
Future<void> run() async => runApp(const App());
