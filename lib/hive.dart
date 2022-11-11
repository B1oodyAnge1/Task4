import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:flutter_application_1/main.dart';

class HiveWidgetModdel {
  void CreateElementBox(
    String url1,
    String fileName1,
    String extensio1,
  ) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HistoryAdapter());
    }
    var box = await Hive.openBox<History>('MyHestoryBox');
    final history = History('My2Url', 'MyNam2e', 'MyEx2tn');

    await box.add(history);
    print(box.values);
    box.close();
  }
}

class History {
  @HiveField(0)
  late String url;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String extensio;

  History(
    this.url,
    this.name,
    this.extensio,
  );
  @override
  String toString() => 'URL: $url, NAME: $name, EXTENSION: $extensio';
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final typeId = 0;

  @override
  History read(BinaryReader reader) {
    final String url = reader.read();
    print('1');
    final String name = reader.read();
    print('2');
    final String extensio = reader.read();
    print('3');
    return History(
      url,
      name,
      extensio,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer.writeString(obj.url);
    print('11');
    writer.writeString(obj.name);
    print('22');
    writer.writeString(obj.extensio);
    print('33');
  }
}
