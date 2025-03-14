import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/diamond_car.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state.lotIds.isEmpty) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.lotIds.length + 1,
            itemBuilder: (_, i) {
              if (i < (state.lotIds.length)) {
                final item = context.read<CartCubit>().cartList[i];
                return DiamondCard(item: item);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Text(
                        "Total Carat:",
                        style: TextStyle(fontSize: 14),
                      ),
                      title: Text("${context.read<CartCubit>().totalCarat}"),
                    ),
                    ListTile(
                      leading: Text(
                        "Total Price:",
                        style: TextStyle(fontSize: 14),
                      ),
                      title: Text("${context.read<CartCubit>().totalPrice}"),
                    ),
                  ],
                );
              }
            },
            separatorBuilder: (_, __) => Divider(height: 0),
          );
        },
      ),
    );
  }
}
