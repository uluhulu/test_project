import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/presentation/cart/bloc/cart_bloc.dart';

import '../../../domain/models/product/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final Function() onTap;
  const CartItem({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 59,
                height: 39,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  // height: 39,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.raleway(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2C2F39)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${product.cost} ₽",
                    style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff2C2F39)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    product.sizes,
                    style: GoogleFonts.raleway(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2C2F39)),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 108,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xffF1F4F9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.remove_rounded,
                        size: 20,
                        color: Color(0xff2C2F39),
                      ),
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(DeleteItemE(product: product));
                      },
                    ),
                    Text(
                      product.selectedCount.toString(),
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff2C2F39)),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.add_rounded,
                        size: 20,
                        color: Color(0xff2C2F39),
                      ),
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddItemE(product: product));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffF1F4F9),
          )
        ],
      ),
    );
  }
}
