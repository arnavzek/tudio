import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

final String assetName = 'assets/audio.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo Button');

class AudioInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: svg);
  }
}
