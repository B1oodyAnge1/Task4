import 'package:hive_flutter/hive_flutter.dart';

import 'Entitis/historyModal.dart';

class HiveWidgetModdel {
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

    await box.add(history);
  }

  Future<Map<int, String>> UrlReadElementBox(Box<History> box) async {
    int index = 0;
    var myUrl = <int, String>{};
    while (box.length > index) {
      myUrl[index] = box.getAt(index)!.url.toString();

      index++;
    }

    return myUrl;
  }

  Future<Map<int, String>> NameReadElementBox(Box<History> box) async {
    int index = 0;
    var myName = <int, String>{};
    while (box.length > index) {
      myName[index] = box.getAt(index)!.name.toString();

      index++;
    }

    return myName;
  }

  Future<Map<int, String>> ExtensionReadElementBox(Box<History> box) async {
    int index = 0;
    var myExtension = <int, String>{};
    while (box.length > index) {
      myExtension[index] = box.getAt(index)!.extensio.toString();

      index++;
    }

    return myExtension;
  }

  Future<Map<int, String>> TimeReadElementBox(Box<History> box) async {
    int index = 0;
    var myTime = <int, String>{};
    while (box.length > index) {
      myTime[index] = box.getAt(index)!.time.toString();

      index++;
    }

    return myTime;
  }
}
