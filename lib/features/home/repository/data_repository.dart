import '../../../data/diamond_json.dart';
import '../../../models/diamond.dart';

class DataRepository {
  late final List<Diamond> diamonds;
  List<Diamond> parseData() {
    try {
      final result = DataSource.list.map((e) => Diamond.fromJson(e)).toList();
      diamonds = result;
      return result;
    } catch (e) {
      return [];
    }
  }
}
