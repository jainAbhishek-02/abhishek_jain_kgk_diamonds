import 'package:equatable/equatable.dart';

class FilterModel extends Equatable {
  final String id;
  final bool isSelected;
  const FilterModel({required this.id, this.isSelected = false});

  FilterModel copyWith({String? id, bool? isSelected}) {
    return FilterModel(
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, isSelected];
}
