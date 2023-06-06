import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/domain/models/catalog/catalog.dart';
import 'package:test_project/presentation/menu/widgets/menu_item.dart';
import 'package:test_project/presentation/menu/widgets/timer/cubit/timer_cubit.dart';

class MenuLoaded extends StatelessWidget {
  final List<Catalog> catalogList;
  const MenuLoaded({super.key, required this.catalogList});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 15,
                    child: Container(
                      width: 72,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              formatedTime(time: state.seconds),
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xff2C2F39)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              // childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: catalogList.length,
          itemBuilder: (BuildContext ctx, index) {
            return MenuItem(
              imageUrl: catalogList[index].imageUrl,
              title: catalogList[index].categoryName,
              onTap: () {
                context.goNamed(
                  "category",
                  extra: catalogList[index].products,
                  queryParameters: {"title": catalogList[index].categoryName},
                );
              },
            );
          }),
      Container(
        width: 10,
        height: 10,
        color: Colors.white,
      )
    ]);
  }

  formatedTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }
}
