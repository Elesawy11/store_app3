import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:store_app3/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app3/cubits/category_cubit/category_cubit.dart';
import 'package:store_app3/cubits/favorite_cuibt/favorite_cubit.dart';
// import 'package:store_app3/cubits/update_cubit/update_cubit.dart';
import 'package:store_app3/providers/favorite_provider.dart';
import 'package:store_app3/simple_bloc_observer.dart';
import 'package:store_app3/views/home_view.dart';

import 'cubits/store_cubit/store_cubit.dart';

void main(List<String> args) {
  Bloc.observer = SimpleBlocObserver();
  return runApp(ChangeNotifierProvider(
      create: (context) => FavoriteProvider(), child: const StoreApp()));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StoreCubit()),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        // BlocProvider(create: (context) => UpdateCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
        
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
