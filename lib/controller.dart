import 'package:flutter_application_1/Entitis/historyModal.dart';
import 'package:flutter_application_1/hive.dart';
import 'package:intl/intl.dart';

final model = HiveWidgetModdel();
var myUrl = <int, String>{};

void CreateMyBox(
  String url,
  String fileName,
  String extension,
) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(now);
  print(formattedDate);
  model.CreateElementBox(url, fileName, extension, formattedDate);
}

void fun() {
  Future<Map<int, String>> historyUrl;

  historyUrl = model.UrlReadElementBox();
  historyUrl.then((value) {
    myUrl = value;
  });
}

Map<int, String> ReadMyBox() {
  fun();
  var book = <int, String>{0: 'myUrl', 1: 'myUrl'};
  print('==================== ${myUrl[0]} =============== ${book[1]}');
  return myUrl;
}
