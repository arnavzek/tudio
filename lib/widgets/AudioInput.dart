import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

final String assetName = 'assets/audio.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo Button');

class AudioButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: 75,
      width: 75,
      child: svg,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(500),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
    );
  }
}

class AudioInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Center(child: AudioButton()));
  }
}
