import 'package:flutter_application_1/hive.dart';
import 'package:intl/intl.dart';

void CreateMyBox(
  String url,
  String fileName,
  String extension,
) {
  final model = HiveWidgetModdel();
  DateTime now = DateTime.now();

  print(DateFormat('dd-MM-yyyy – kk:mm').format(now));
  model.CreateElementBox(url, fileName, extension);
}
