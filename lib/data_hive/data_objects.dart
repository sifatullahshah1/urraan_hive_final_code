import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'data_objects.g.dart';

@HiveType(typeId: 0)
class DataObejcts {
  @HiveField(0)
  dynamic key;
  @HiveField(1, defaultValue: "")
  String name = "";
  @HiveField(2, defaultValue: "")
  String address = "";
  @HiveField(3)
  Uint8List? profileImage;
  @HiveField(4, defaultValue: [])
  List<String> hobbies = [];
}
