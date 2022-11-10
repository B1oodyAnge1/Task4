import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:flutter_application_1/main.dart';

class HiveWidgetModdel {
  void jastDoIt(String name) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HistoryAdapter());
    }

    var box = await Hive.openBox('MyBox');
    box.close();
  }

  void CreateElementBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HistoryAdapter());
    }
    var box = await Hive.openBox('MyBox');
    final history = History('MyName');
    box.close();
  }
}

class History {
  late String name;
  History(this.name);
  @override
  String toString() => name;
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final typeId = 0;

  @override
  History read(BinaryReader reader) {
    final name = reader.readString();
    return History(
      name,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer.writeString(obj.name);
  }
}
