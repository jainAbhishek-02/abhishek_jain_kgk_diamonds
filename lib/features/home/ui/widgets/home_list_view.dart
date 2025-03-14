import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/diamond_car.dart';
import '../../bloc/home_cubit.dart';
import '../../bloc/home_state.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          if (state.diamonds.isEmpty) {
            return Center(child: Text("No diamonds found"));
          }
          return ListView.separated(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: state.diamonds.length,
            itemBuilder: (c, i) {
              final item = state.diamonds[i];
              return DiamondCard(item: item);
            },
            separatorBuilder: (_, __) => Divider(height: 0),
          );
        }
        return CircularProgressIndicator.adaptive();
      },
    );
  }
}
