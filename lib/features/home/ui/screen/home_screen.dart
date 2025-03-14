import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/bloc/cart_cubit.dart';
import '../../../cart/bloc/cart_state.dart';
import '../../../cart/ui/cart_screen.dart';
import '../../bloc/home_cubit.dart';
import '../../bloc/home_state.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/home_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<HomeCubit, HomeState, int>(
          selector: (state) => state is HomeSuccess ? state.diamonds.length : 0,
          builder: (context, state) {
            return Text("Diamonds $state");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (ctx) {
                  return const FilterBottomSheet();
                },
              );
            },
            icon: Icon(Icons.filter_alt_rounded),
          ),
        ],
      ),
      body: const HomeListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => CartScreen()));
        },
        child: BlocSelector<CartCubit, CartState, int>(
          selector: (state) => state.lotIds.length,
          builder: (context, state) {
            return Badge(
              label: Text("$state"),
              child: Icon(Icons.shopping_cart_checkout_rounded),
            );
          },
        ),
      ),
    );
  }
}
