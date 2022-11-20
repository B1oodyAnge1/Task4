import 'package:flutter_application_1/Entitis/historyModal.dart';
import 'package:flutter_application_1/hive.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

final model = HiveWidgetModdel();

var box;

void awFun() async {
  box = await Hive.openBox<History>('History');
}

void createMyBox(
  String url,
  String fileName,
  String extension,
) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(now);

  model.CreateElementBox(box, url, fileName, extension, formattedDate);
}

Future<Map<int, String>> ReadMyBox(int expres) async {
  switch (expres) {
    case 0:
      return await model.UrlReadElementBox(box);
    case 1:
      return model.NameReadElementBox(box);
    case 2:
      return model.ExtensionReadElementBox(box);
    case 3:
      return model.TimeReadElementBox(box);
    default:
      return model.TimeReadElementBox(box);
  }
}
