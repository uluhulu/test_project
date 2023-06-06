import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_project/presentation/app/app_state_cubit/cubit/app_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/presentation/cart/bloc/cart_bloc.dart';
import 'package:test_project/presentation/menu/widgets/timer/cubit/timer_cubit.dart';
import 'package:test_project/use_cases/cart/cart_store.dart';

import '../../domain/repos/catalog_repo/catalog_repo.dart';
import '../../locator/locator.dart';
import '../menu/bloc/menu_bloc.dart';
import '../navigation/cubit/bottom_tab_bar_cubit.dart';
import '../navigation/router.dart';
import 'app_state_cubit/cubit/app_loaded_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomTabBarCubit>(
          create: (context) => BottomTabBarCubit(),
        ),
        BlocProvider<AppStateCubit>(
          create: (context) => AppStateCubit(),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(
            repository: sl.get<CatalogRepository>(),
          ),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(
            sl.get<CartStore>(),
          ),
        ),
        BlocProvider<TimerCubit>(
          create: (context) => TimerCubit(),
        ),
      ],
      child: BlocBuilder<AppStateCubit, AppState>(
        builder: (context, state) {
          if (state is AppLoadedState) {
            return EasyLocalization(
              supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
              path: 'assets/translations',
              fallbackLocale: const Locale('en', 'US'),
              child: const TestApp(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({
    Key? key,
    this.home,
    this.navKey,
  }) : super(key: key);

  final Widget? home;
  final GlobalKey<NavigatorState>? navKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primaryColor: Colors.black),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
