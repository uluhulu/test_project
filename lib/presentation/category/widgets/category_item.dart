import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/domain/models/product/product.dart';

import '../../navigation/cubit/bottom_tab_bar_cubit.dart';

class CategoryItem extends StatelessWidget {
  final Product product;
  final Function onTap;

  const CategoryItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          {BlocProvider.of<BottomTabBarCubit>(context).showModal(product)},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff5666A71A).withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 6)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(children: [
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            height: 98,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 15,
                child: Text(
                  product.name,
                  style: GoogleFonts.raleway(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2C2F39)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12.0,
              left: 12.0,
            ),
            child: Row(
              children: [
                Text(
                  "${product.cost} ₽",
                  style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff2C2F39)),
                ),
                const SizedBox(
                  width: 23,
                ),
                CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: const Color(0xffFE5000),
                    padding: EdgeInsets.zero,
                    child: const SizedBox(
                      width: 85,
                      height: 36,
                      child: Icon(
                        Icons.add_rounded,
                        size: 20,
                      ),
                    ),
                    onPressed: () => onTap())
              ],
            ),
          )
        ]),
      ),
    );
  }
}
