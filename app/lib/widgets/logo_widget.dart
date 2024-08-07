import 'package:flutter/material.dart';
import 'package:path/path.dart';

class WaveLogo extends StatelessWidget {
  final bool fullText;
  final TextStyle? style;

  const WaveLogo({super.key, this.fullText = true, this.style});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: "PlanetKosmos",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: Theme.of(context).colorScheme.primary);

    TextStyle applied = style.merge(this.style);

    return Hero(
        tag: "wave-logo",
        child: Material(
          color: Colors.transparent,
          child: Text(
            fullText ? "Wave*" : "W*",
            style: applied,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
