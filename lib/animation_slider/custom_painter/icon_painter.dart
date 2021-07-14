import 'package:flutter/material.dart';

class IconPainter extends CustomPainter {
  var _paintLine;
  double animationValue;
  IconPainter({required this.animationValue});
  
  @override
  void paint(Canvas canvas, Size size) {

    _paintLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 3 * (1-animationValue)
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(
        Offset(size.width / 2 - 5 *(1- animationValue), (size.height / 2)),
        Offset((size.width / 2), size.height / 2 + 3 *  (1- animationValue)),
        _paintLine);
    canvas.drawLine(
        Offset(size.width / 2 + 6 * (1- animationValue),
            size.height / 2 - 3 * (1- animationValue)),
        Offset((size.width / 2), size.height / 2 + 3 * (1- animationValue)),
        _paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}