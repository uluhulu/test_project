import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount({
    Key? key,
    required this.count,
    required this.isSelected,
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.fastOutSlowIn,
  }) : super(duration: duration, curve: curve, key: key);

  final num count;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween _intCount = IntTween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_intCount.evaluate(animation).toString()} ₽',
      style: widget.isSelected
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
    );
  }

  // @override
  // void initState() {
  //   _intCount.evaluate(animation);
  //   super.initState();
  // }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _intCount = visitor(
      _intCount,
      widget.count,
      (dynamic value) => IntTween(begin: value),
    ) as IntTween;
  }
}
