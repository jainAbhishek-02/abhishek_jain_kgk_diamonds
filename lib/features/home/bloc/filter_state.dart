// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../models/filter_model.dart';

// ignore: constant_identifier_names
enum Sort { ASC, DESC }

class FilterState extends Equatable {
  const FilterState({
    this.size = const {},
    this.lab = const {},
    this.shape = const {},
    this.color = const {},
    this.clarity = const {},
  });
  final Set<FilterModel> size;
  final Set<FilterModel> lab;
  final Set<FilterModel> shape;
  final Set<FilterModel> color;
  final Set<FilterModel> clarity;

  FilterState copyWith({
    Set<FilterModel>? size,
    Set<FilterModel>? lab,
    Set<FilterModel>? shape,
    Set<FilterModel>? color,
    Set<FilterModel>? clarity,
    Sort? finalPriceSort,
    Sort? caratWeightSort,
  }) {
    return FilterState(
      size: size ?? this.size,
      lab: lab ?? this.lab,
      shape: shape ?? this.shape,
      color: color ?? this.color,
      clarity: clarity ?? this.clarity,
    );
  }

  @override
  List<Object?> get props => [
    size,
    lab,
    shape,
    color,
    clarity,
  ];
}
