import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;

  const MenuItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: () => onTap(),
      child: Ink(
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
            imageUrl: imageUrl,
            height: 124,
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 38,
                child: Text(
                  title,
                  style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff2C2F39)),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
