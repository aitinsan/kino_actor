import 'package:flutter/material.dart';

class RadioButtonPainter extends CustomPainter {
  bool isSelected;
  final Color color;

  RadioButtonPainter({required this.color, required this.isSelected});


  
  var _paint;
  @override
  void paint(Canvas canvas, Size size) {
    if (isSelected == true) {
      _paint = Paint()
        ..color = color
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
    } else {
      _paint = Paint()
        ..color = color
        ..strokeWidth = 3
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;
    }
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 10, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
