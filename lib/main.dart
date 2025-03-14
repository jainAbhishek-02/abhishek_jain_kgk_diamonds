import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/cart/bloc/cart_cubit.dart';
import 'features/home/bloc/filter_cubit.dart';
import 'features/home/bloc/home_cubit.dart';
import 'features/home/repository/data_repository.dart';
import 'features/home/ui/screen/home_screen.dart';
import 'services/database/local_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveFunctions.boxname);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository()..parseData(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FilterCubit(context.read<DataRepository>()),
            lazy: false,
          ),
          BlocProvider(
            create:
                (context) =>
                    HomeCubit(repo: context.read<DataRepository>())..loadData(),
          ),
          BlocProvider(
            create:
                (context) =>
                    CartCubit(repo: context.read<DataRepository>())..initCart(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          title: 'Abhishek Jain Assessment',
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
