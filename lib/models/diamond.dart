import 'package:equatable/equatable.dart';

class Diamond extends Equatable {
  final String? qty;
  final String? lotId;
  final String? size;
  final num? carat;
  final String? lab;
  final String? shape;
  final String? color;
  final String? clarity;
  final String? cut;
  final String? polish;
  final String? symmetry;
  final String? fluorescence;
  final String? discount;
  final String? perCaratRate;
  final num? finalAmount;
  final String? keyToSymbol;
  final String? labComment;

  const Diamond({
    this.qty,
    this.lotId,
    this.size,
    this.carat,
    this.lab,
    this.shape,
    this.color,
    this.clarity,
    this.cut,
    this.polish,
    this.symmetry,
    this.fluorescence,
    this.discount,
    this.perCaratRate,
    this.finalAmount,
    this.keyToSymbol,
    this.labComment,
  });

  Diamond.fromJson(Map<String, dynamic> json)
    : qty = json['Qty'],
      lotId = json['Lot ID'],
      size = json['Size'],
      carat = num.tryParse(json['Carat'] ?? "0")??0.0,
      lab = json['Lab'],
      shape = json['Shape'],
      color = json['Color'],
      clarity = json['Clarity'],
      cut = json['Cut'],
      polish = json['Polish'],
      symmetry = json['Symmetry'],
      fluorescence = json['Fluorescence'],
      discount = json['Discount'],
      perCaratRate = json['Per Carat Rate'],
      finalAmount = num.tryParse(json['Final Amount']?.replaceAll(',', '') ??"0")??0,
      keyToSymbol = json['Key To Symbol'],
      labComment = json['Lab Comment'];

  Diamond copyWith({
    String? qty,
    String? lotId,
    String? size,
    num? carat,
    String? lab,
    String? shape,
    String? color,
    String? clarity,
    String? cut,
    String? polish,
    String? symmetry,
    String? fluorescence,
    String? discount,
    String? perCaratRate,
    num? finalAmount,
    String? keyToSymbol,
    String? labComment,
  }) {
    return Diamond(
      qty: qty ?? this.qty,
      lotId: lotId ?? this.lotId,
      size: size ?? this.size,
      carat: carat ?? this.carat,
      lab: lab ?? this.lab,
      shape: shape ?? this.shape,
      color: color ?? this.color,
      clarity: clarity ?? this.clarity,
      cut: cut ?? this.cut,
      polish: polish ?? this.polish,
      symmetry: symmetry ?? this.symmetry,
      fluorescence: fluorescence ?? this.fluorescence,
      discount: discount ?? this.discount,
      perCaratRate: perCaratRate ?? this.perCaratRate,
      finalAmount: finalAmount ?? this.finalAmount,
      keyToSymbol: keyToSymbol ?? this.keyToSymbol,
      labComment: labComment ?? this.labComment,
    );
  }

  @override
  List<Object?> get props => [
    qty,
    lotId,
    size,
    carat,
    lab,
    shape,
    color,
    clarity,
    cut,
    polish,
    symmetry,
    fluorescence,
    discount,
    perCaratRate,
    finalAmount,
    keyToSymbol,
    labComment,
  ];
}
