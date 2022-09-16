import 'dart:math';
import 'package:flutter/material.dart';

class ShimmerLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ShimmerLoading({Key? key,
    required this.isLoading,
    required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    List<List<Color>> colors = [
      [
        Colors.greenAccent,
        Colors.lightGreenAccent,
        Colors.yellowAccent.shade200,
      ],
      [
        Colors.grey,
        Colors.grey.shade400,
        Colors.deepPurpleAccent.shade100,
      ],
      [
        Colors.red.shade100,
        Colors.deepOrange.shade500,
        Colors.deepOrangeAccent.shade200
      ],
      [
        Colors.blue.shade400,
        Colors.lightBlue.shade200,
        Colors.orangeAccent.shade100,
      ]

    ];

    final _shimmerGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [
        0.1,
        0.4,
        0.8,
      ],
      colors:   [
        Colors.greenAccent,
        Colors.lightGreenAccent,
        Colors.yellowAccent.shade200,
      ],
    );

    if (!isLoading) {
      return child;
    }
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: child,
    );
  }
}
