import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/bloc/cart_cubit.dart';
import '../../features/cart/bloc/cart_state.dart';
import '../../models/diamond.dart';
import 'addremove_btn.dart';

class DiamondCard extends StatelessWidget {
  const DiamondCard({super.key, required this.item});

  final Diamond item;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey("${item.lotId}"),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Lot Id: ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: item.lotId!,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: Text("Carat: ${item.carat!}")),
              Expanded(child: Text("Shape: ${item.shape!}")),
              Expanded(child: Text("Color: ${item.color!}")),
            ],
          ),
          Text(
            "Key to symbol: ${item.keyToSymbol!.isEmpty ? "--" : item.keyToSymbol!}",
          ),
          Text(
            "Lab comment: ${item.labComment!.isEmpty ? "--" : item.labComment!}",
          ),
          Text("Per carat rate: ₹${item.perCaratRate!}"),
          Text("Final Amount: ₹${item.finalAmount!}"),
          Align(
            alignment: Alignment.centerRight,
            child: BlocSelector<CartCubit, CartState, bool>(
              selector: (state) => state.lotIds.contains(item.lotId),
              builder: (context, state) {
                return AddRemoveBtn(
                  isAdded: state,
                  onTap: () {
                    state
                        ? context.read<CartCubit>().removeItem(item.lotId!)
                        : context.read<CartCubit>().addItem(item.lotId!);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
