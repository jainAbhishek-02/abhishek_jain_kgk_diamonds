import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<String> lotIds;

  const CartState({required this.lotIds});

  @override
  List<Object?> get props => [lotIds];
}
