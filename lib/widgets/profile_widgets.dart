import 'package:flutter/material.dart';

Duration duration = const Duration();

//TIMER
Widget timer() {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return Text(
    '$minutes:$seconds',
    style: const TextStyle(
      fontSize: 20,
    ),
  );
}
