import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  static const boxname = 'DefaultDB';
  static final box = Hive.box(boxname);

  static List<String> getStringList(String key) {
    List<String> value = box.get(key) ?? [];
    return value;
  }

  static saveStringList(String key, List<String> data) {
    box.put(key, data);
  }

  static deleteUser(String key) {
    return box.delete(key);
  }

  static deleteAllUser(String key) {
    return box.deleteAll(box.keys);
  }

  static void deleteAllKeys(Iterable<dynamic> list) async {
    await box.deleteAll(list);
  }
}
