import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/presentation/cart/bloc/cart_bloc.dart';
import 'package:test_project/presentation/navigation/tab_bar_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/animated_count.dart';
import '../widgets/modals/product_modal.dart';
import 'cubit/bottom_tab_bar_cubit.dart';
import 'custom_tab_bar.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  void _onItemTapped(
      BuildContext context, int tabIndex, String initialLocation) {
    context.go(initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomTabBarCubit, BottomTabBarState>(
      listener: (context, state) {
        if (state is ShowModalState) {
          showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext bc) {
                return ProductModal(
                  product: state.product,
                );
              });
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<BottomTabBarCubit>(context);
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: CustomBottomBar(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabBarItem(
                    initialLocation: '/menu',
                    icon: state.currentIndex == 0
                        ? SvgPicture.asset('assets/icons/kitchen.svg',
                            color: const Color(0xff2C2F39))
                        : SvgPicture.asset(
                            'assets/icons/kitchen.svg',
                          ),
                    text: state.currentIndex == 0
                        ? Text(
                            'food'.tr(),
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2C2F39),
                            ),
                          )
                        : Text(
                            'food'.tr(),
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2C2F39),
                            ),
                          ),
                    onTap: () {
                      setState(() {
                        if (state.currentIndex != 0) {
                          cubit.changeIndex(0);
                          _onItemTapped(context, 0, '/menu');
                        }
                      });
                    },
                  ),
                  BlocListener<CartBloc, CartState>(
                    listener: (context, cartState) {
                      if (cartState is CartLoadedS) {
                        setState(() {
                          cubit.changeSum(cartState.sum);
                        });
                      }
                    },
                    child: TabBarItem(
                      initialLocation: '/cart',
                      icon: state.currentIndex == 1
                          ? SvgPicture.asset('assets/icons/buy.svg',
                              color: const Color(0xff2C2F39))
                          : SvgPicture.asset(
                              'assets/icons/buy.svg',
                            ),
                      text: state.sum == 0
                          ? Text(
                              'cart'.tr(),
                              style: state.currentIndex == 1
                                  ? GoogleFonts.raleway(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff2C2F39),
                                    )
                                  : GoogleFonts.raleway(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff9EA7B6),
                                    ),
                            )
                          : AnimatedCount(
                              count: state.sum,
                              isSelected: state.currentIndex == 1,
                            ),
                      onTap: () {
                        setState(() {
                          if (state.currentIndex != 1) {
                            cubit.changeIndex(1);
                            _onItemTapped(context, 1, '/cart');
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
