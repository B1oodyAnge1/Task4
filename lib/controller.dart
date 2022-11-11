import 'package:flutter_application_1/hive.dart';

void CreateMyBox(
  String url,
  String fileName,
  String extension,
) {
  final model = HiveWidgetModdel();
  print('Я тут 1');
  model.CreateElementBox(url, fileName, extension);
}
