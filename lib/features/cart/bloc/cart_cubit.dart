import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/diamond.dart';
import '../../../services/database/database_keys.dart';
import '../../../services/database/local_data.dart';
import '../../home/repository/data_repository.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required DataRepository repo})
    : _repo = repo,
      super(const CartState(lotIds: []));

  final DataRepository _repo;
  late final List<Diamond> _cartList;
  List<Diamond> get cartList => _cartList;

  double get totalCarat =>
      _cartList.fold(0.0, (sum, diamond) => sum + diamond.carat!);

  double get totalPrice =>
      _cartList.fold(0.0, (sum, diamond) => sum + diamond.finalAmount!);

  void initCart() {
    final ids = HiveFunctions.getStringList(DatabaseKeys.cartIds);
    emit(CartState(lotIds: [...ids]));
    _cartList = [
      ..._repo.diamonds.where((e) => state.lotIds.contains(e.lotId)),
    ];
  }

  void addItem(String id) {
    _cartList.add(_repo.diamonds.firstWhere((e) => e.lotId == id));
    emit(CartState(lotIds: [...state.lotIds, id]));
    HiveFunctions.saveStringList(DatabaseKeys.cartIds, state.lotIds);
  }

  void removeItem(String id) {
    final list = [...state.lotIds];
    list.remove(id);
    _cartList.removeWhere((e) => e.lotId == id);
    emit(CartState(lotIds: [...list]));
    HiveFunctions.saveStringList(DatabaseKeys.cartIds, state.lotIds);
  }
}
