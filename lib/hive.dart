import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/main.dart';

import 'Entitis/historyModal.dart';

class HiveWidgetModdel {
  HiveWidgetModdel() {
    if (!Hive.isAdapterRegistered(200)) {
      Hive.registerAdapter(HistoryAdapter());
    }
  }

  Future<void> CreateElementBox(
    String url,
    String fileName,
    String extension,
    String time,
  ) async {
    var box = await Hive.openBox<History>('History');
    final history = History(
      url: url,
      name: fileName,
      extensio: extension,
      time: time,
    );
    //box.deleteAt(0);
    await box.add(history);
    print(box.values);
    box.close();
  }

  Future<Map<int, String>> UrlReadElementBox() async {
    var box = await Hive.openBox<History>('History');
    //box.getAt(0);
    int index = 0;
    var myUrl = <int, String>{};
    while (box.length > index) {
      myUrl[index] = box.getAt(index)!.url.toString();
      //print(myUrl[0]);
      index++;
    }
    //= box.getAt(0)!.name;

    box.close();

    return myUrl;
  }
}
