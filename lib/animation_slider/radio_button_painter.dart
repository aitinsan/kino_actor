import 'package:flutter/material.dart';

class EmptyRadioButtonPainter extends CustomPainter {
  bool isSelected;
  final Color color;
  double animationValue;
  EmptyRadioButtonPainter({
    required this.color,
    required this.isSelected,
    required this.animationValue,
  });

  var _paintCircle;

  @override
  void paint(Canvas canvas, Size size) {
    _paintCircle = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 15, _paintCircle);
    if (isSelected == true) {
      canvas.drawCircle(
          center,
          (animationValue) * 13,
          Paint()
            ..color = Colors.black
            ..strokeWidth = 0
            ..style = PaintingStyle.fill
            ..strokeCap = StrokeCap.round);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
