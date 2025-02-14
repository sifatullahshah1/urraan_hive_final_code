// flutter packages pub run build_runner build
//
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
import 'package:database_hive_app/data_hive/data_objects.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GeneralBox {
  static const String dataObejcts = "DataObejcts";

  static Box<DataObejcts> getDataObejcts() {
    return Hive.box<DataObejcts>(dataObejcts);
  }

  static bool addUpdateDataObejcts(DataObejcts dataObejcts) {
    var boxDataObejcts = getDataObejcts();

    boxDataObejcts.put(dataObejcts.key, dataObejcts);
    if (boxDataObejcts.containsKey(dataObejcts.key)) {
      return true;
    } else {
      return false;
    }
  }

  // static List<DataObejcts> getAllDataObejcts() {
  //   var boxDataObejcts = getDataObejcts();
  //   List<DataObejcts> values =
  //       boxDataObejcts.values.toList().cast<DataObejcts>();
  //
  //   // boxDataObejcts.keys.toList().cast<String>();
  //   return values;
  // }

  // static bool deleteDataObejcts(String key) {
  //   var boxDataObejcts = getDataObejcts();
  //   boxDataObejcts.delete(key);
  //   if (!boxDataObejcts.containsKey(key)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static String getUniqueKey() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static getHiveFunction() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(DataObejctsAdapter().typeId)) {
      Hive.registerAdapter(DataObejctsAdapter());
    }

    if (!Hive.isBoxOpen(dataObejcts)) {
      await Hive.openBox<DataObejcts>(dataObejcts);
    }
  }
}
