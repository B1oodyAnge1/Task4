import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/main.dart';

import 'Entitis/historyModal.dart';

class HiveWidgetModdel {
  HiveWidgetModdel() {
    if (!Hive.isAdapterRegistered(100)) {
      Hive.registerAdapter(HistoryAdapter());
    }
  }

  Future<void> CreateElementBox(
    String url1,
    String fileName1,
    String extensio1,
  ) async {
    var box = await Hive.openBox<History>('MyHestoryBox2');
    final history =
        History(url: 'My2Ur999999l', name: 'MyNam2e', extensio: 'MyEx2tn');
    //box.deleteAt(0);
    await box.add(history);
    print(box.values);
    box.close();
  }
}

// @HiveType(typeId: 1)
// class History {
//   @HiveField(0)
//   late String url;
//   @HiveField(1)
//   late String name;
//   @HiveField(2)
//   late String extensio;

//   History({
//     required this.url,
//     required this.name,
//     required this.extensio,
//   });
//   @override
//   String toString() => 'URL: $url, NAME: $name, EXTENSION: $extensio';
// }

// class HistoryAdapter extends TypeAdapter<History> {
//   @override
//   final typeId = 0;

//   @override
//   History read(BinaryReader reader) {
//     final String url = reader.read();
//     print('1');
//     final String name = reader.read();
//     print('2');
//     final String extensio = reader.read();
//     print('3');
//     return History(
//       url: url,
//       name: name,
//       extensio: extensio,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, History obj) {
//     writer.writeString(obj.url);
//     print('11');
//     writer.writeString(obj.name);
//     print('22');
//     writer.writeString(obj.extensio);
//     print('33');
//   }
//}
