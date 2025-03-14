import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/filter_model.dart';
import '../repository/data_repository.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._repo) : super(FilterState()) {
    _initFilters();
  }

  final DataRepository _repo;

  void _initFilters() {
    Set<FilterModel> size = {};
    Set<FilterModel> lab = {};
    Set<FilterModel> shape = {};
    Set<FilterModel> color = {};
    Set<FilterModel> clarity = {};
    for (var itm in _repo.diamonds) {
      size.add(FilterModel(id: itm.size!));
      lab.add(FilterModel(id: itm.lab!));
      shape.add(FilterModel(id: itm.shape!));
      color.add(FilterModel(id: itm.color!));
      clarity.add(FilterModel(id: itm.clarity!));
    }
    emit(
      state.copyWith(
        clarity: clarity,
        color: color,
        lab: lab,
        shape: shape,
        size: size,
      ),
    );
  }

  void updateFilterData({
    required Set<FilterModel> size,
    required Set<FilterModel> lab,
    required Set<FilterModel> shape,
    required Set<FilterModel> color,
    required Set<FilterModel> clarity,
  }) {
    emit(
      state.copyWith(
        clarity: clarity,
        color: color,
        lab: lab,
        shape: shape,
        size: size,
      ),
    );
  }
}
