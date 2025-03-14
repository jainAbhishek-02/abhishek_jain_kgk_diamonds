import 'package:equatable/equatable.dart';

import '../../../models/diamond.dart';

class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeSuccess extends HomeState {
  final List<Diamond> diamonds;

  const HomeSuccess({required this.diamonds});

  @override
  List<Object?> get props => [diamonds];
}
