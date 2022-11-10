import 'package:flutter_application_1/hive.dart';

void UsingHive() {
  final model = HiveWidgetModdel();
  String name = 'MyName';
  model.jastDoIt(name);
}

void CreateMyBox() {
  final model = HiveWidgetModdel();
  print('Я тут 1');
}
