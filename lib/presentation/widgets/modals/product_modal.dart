import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/models/product/product.dart';

class ProductModal extends StatelessWidget {
  final Product product;
  const ProductModal({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            )),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 40,
          ),
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            height: 221,
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
            height: 24,
          ),
          Text(product.name,
              style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff2C2F39))),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text("${product.cost} ₽",
                  style: GoogleFonts.raleway(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff2C2F39))),
              const Spacer(),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  color: const Color(0xffFE5000),
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: Center(
                      child: Text('Хочу!',
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                  ),
                  onPressed: () => {})
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(product.description ?? '',
                maxLines: 10,
                style: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          ),
        ]),
      )
    ]);
  }
}
