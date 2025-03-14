import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/diamond.dart';
import '../../../models/filter_model.dart';
import '../repository/data_repository.dart';
import 'filter_state.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required DataRepository repo})
    : _repo = repo,
      super(const HomeInitial());

  final DataRepository _repo;
  late final List<Diamond> _masterList;

  void loadData() {
    _masterList = [..._repo.diamonds];
    emit(HomeSuccess(diamonds: _masterList));
  }

  void applyFilter({
    required Set<FilterModel> size,
    required Set<FilterModel> lab,
    required Set<FilterModel> shape,
    required Set<FilterModel> color,
    required Set<FilterModel> clarity,
    Sort? caratWeightSort,
    Sort? finalPriceSort,
  }) {
    final list =
        _masterList.where((ml) {
          final hasSize =
              size.every((e) => !e.isSelected) ||
              size.any((e) {
                if (e.isSelected && _filterBySize(e.id, ml.carat!)) {
                  return true;
                }
                return false;
              });
          final hasLab =
              lab.every((e) => !e.isSelected) ||
              lab.any((e) {
                if (e.isSelected && e.id == ml.lab) {
                  return true;
                }
                return false;
              });
          final hasShape =
              shape.every((e) => !e.isSelected) ||
              shape.any((e) {
                if (e.isSelected && e.id == ml.shape) {
                  return true;
                }
                return false;
              });
          final hasColor =
              shape.every((e) => !e.isSelected) ||
              shape.any((e) {
                if (e.isSelected && e.id == ml.color) {
                  return true;
                }
                return false;
              });
          final hasClarity =
              shape.every((e) => !e.isSelected) ||
              shape.any((e) {
                if (e.isSelected && e.id == ml.clarity) {
                  return true;
                }
                return false;
              });
          return hasSize && hasLab && hasShape && hasColor && hasClarity;
        }).toList();

    emit(HomeSuccess(diamonds: list));
  }

  void clearFilter() {
    emit(HomeSuccess(diamonds: _masterList));
  }

  List<Diamond> sortDiamonds(
    List<Diamond> diamonds, {
    bool? caratAscending,
    bool? finalAmountAscending,
  }) {
    diamonds.sort((a, b) {
      int comparison = 0;

      if (caratAscending != null) {
        comparison = (a.carat!).compareTo(b.carat!);
        if (!caratAscending) {
          comparison *= -1;
        }
      }

      if (comparison == 0 && finalAmountAscending != null) {
        comparison = (a.finalAmount!).compareTo(b.finalAmount!);
        if (!finalAmountAscending) {
          comparison *= -1;
        }
      }

      return comparison;
    });
    return [...diamonds];
  }

  bool _filterBySize(String selectedSize, num carat) {
    List<String> bounds = selectedSize.split('-');
    double lowerBound = double.parse(bounds[0]);
    double upperBound = double.parse(bounds[1]);
    return carat >= lowerBound && carat < upperBound;
  }
}
