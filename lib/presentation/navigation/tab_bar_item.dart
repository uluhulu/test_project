import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final Widget icon;
  final Widget? activeIcon;
  final Widget text;
  final Widget? activeText;
  final String initialLocation;
  final Function() onTap;
  const TabBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.initialLocation,
    required this.onTap,
    this.activeIcon,
    this.activeText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(children: [
        activeIcon ?? icon,
        const SizedBox(
          height: 5,
        ),
        activeIcon ?? text,
      ]),
    );
  }
}
