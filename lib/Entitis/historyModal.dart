import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'historyModal.g.dart';

@HiveType(typeId: 200)
class History {
  @HiveField(0)
  late String url;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String extensio;
  @HiveField(5)
  late String time;

  History({
    required this.url,
    required this.name,
    required this.extensio,
    required this.time,
  });
  @override
  String toString() =>
      'URL: $url, NAME: $name, EXTENSION: $extensio, TIME: $time';
}
