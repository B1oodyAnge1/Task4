import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/main.dart';

import 'Entitis/historyModal.dart';
import 'controller.dart';

class HiveWidgetModdel {
  HiveWidgetModdel() {}

  Future<void> CreateElementBox(
    Box<History> box,
    String url,
    String fileName,
    String extension,
    String time,
  ) async {
    final history = History(
      url: url,
      name: fileName,
      extensio: extension,
      time: time,
    );
    //box.deleteAt(0);
    await box.add(history);
    print(box.values);
  }

  Future<Map<int, String>> UrlReadElementBox(Box<History> box) async {
    //box.getAt(0);
    int index = 0;
    var myUrl = <int, String>{};
    while (box.length > index) {
      myUrl[index] = box.getAt(index)!.url.toString();
      //print(myUrl[0]);
      index++;
    }
    //= box.getAt(0)!.name;

    return myUrl;
  }

  Future<Map<int, String>> NameReadElementBox(Box<History> box) async {
    //box.getAt(0);
    int index = 0;
    var myName = <int, String>{};
    while (box.length > index) {
      myName[index] = box.getAt(index)!.name.toString();
      //print(myUrl[0]);
      index++;
    }
    //= box.getAt(0)!.name;

    return myName;
  }

  Future<Map<int, String>> ExtensionReadElementBox(Box<History> box) async {
    //box.getAt(0);
    int index = 0;
    var myExtension = <int, String>{};
    while (box.length > index) {
      myExtension[index] = box.getAt(index)!.extensio.toString();
      //print(myUrl[0]);
      index++;
    }
    //= box.getAt(0)!.name;

    return myExtension;
  }

  Future<Map<int, String>> TimeReadElementBox(Box<History> box) async {
    //box.getAt(0);
    int index = 0;
    var myTime = <int, String>{};
    while (box.length > index) {
      myTime[index] = box.getAt(index)!.time.toString();
      //print(myUrl[0]);
      index++;
    }
    //= box.getAt(0)!.name;

    return myTime;
  }
}
