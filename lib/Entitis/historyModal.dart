import 'package:hive_flutter/hive_flutter.dart';
part 'historyModal.g.dart';

@HiveType(typeId: 100)
class History {
  @HiveField(0)
  late String url;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String extensio;

  History({
    required this.url,
    required this.name,
    required this.extensio,
  });
  @override
  String toString() => 'URL: $url, NAME: $name, EXTENSION: $extensio';
}
