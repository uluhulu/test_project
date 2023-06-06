import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Widget child;
  const CustomBottomBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          // boxShadow: [
          //   const BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(0.0, -1.0), //(x,y)
          //     blurRadius: 3.0,
          //   ),
          // ],
        ),
        child: child,
      ),
    );
  }
}
