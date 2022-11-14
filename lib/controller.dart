import 'package:flutter_application_1/Entitis/historyModal.dart';
import 'package:flutter_application_1/hive.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

final model = HiveWidgetModdel();
var myUrl = <int, String>{};
var myName = <int, String>{};
var myExtension = <int, String>{};
var myTime = <int, String>{};
var box;

void awFun() async {
  box = await Hive.openBox<History>('History');
}

void CreateMyBox(
  String url,
  String fileName,
  String extension,
) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(now);
  print(formattedDate);
  model.CreateElementBox(box, url, fileName, extension, formattedDate);
}

void fun() async {
  model.UrlReadElementBox(box).then((value) {
    myUrl = value;
  });
  model.NameReadElementBox(box).then((value) {
    myName = value;
  });
  model.ExtensionReadElementBox(box).then((value) {
    myExtension = value;
  });
  model.TimeReadElementBox(box).then((value) {
    myTime = value;
  });
}

Map<int, String> ReadMyBox(int expres) {
  //0)url 1)Name 2)Extension 3)Time
  fun();
  print('==================== ${myUrl[0]} ===============');
  print('==================== ${myName[0]} ===============');
  print('==================== ${myExtension[0]} ===============');
  print('==================== ${myTime[0]} ===============');
  var error = <int, String>{0: 'Error'};

  switch (expres) {
    case 0:
      return myUrl;
    case 1:
      return myName;
    case 2:
      return myExtension;
    case 3:
      return myTime;
    default:
      return error;
  }
}
