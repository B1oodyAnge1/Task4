import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Entitis/historyModal.dart';
import 'converter_view.dart';

import 'hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(200)) {
    Hive.registerAdapter(HistoryAdapter());
  }
  awFun();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ConverterPage(),
    );
  }
}
