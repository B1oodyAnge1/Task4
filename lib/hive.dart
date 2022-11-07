import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:flutter_application_1/main.dart';

class HiveWidgetModdel {
  HiveWidgetModdel() {
    Hive.init('flutter_application_1/');
  }
  void jastDoIt(String name) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HistoryAdapter());
    }

    var box = await Hive.openBox('MyBox');
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
  final tipeId = 0;

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

  @override
  // TODO: implement typeId
  int get typeId => throw UnimplementedError();
}
