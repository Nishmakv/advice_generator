import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceWidget extends StatelessWidget {
  const DiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: const Color(0xff419d7d),
      child: SvgPicture.asset(
        'assets/images/icon-dice.svg',
        width: 20,
      ),
    );
  }
}
