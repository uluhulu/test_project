import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/screen_view.dart';
import 'bloc/menu_bloc.dart';
import 'menu_loaded.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenView(
      title: 'category'.tr(),
      body: const MenuContent(),
    );
  }
}

class MenuContent extends StatelessWidget {
  const MenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoadingS) {
          return Container();
        }
        if (state is MenuLoadedS) {
          return MenuLoaded(
            catalogList: state.catalog,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
