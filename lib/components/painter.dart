import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = MyColors.defaultPurple;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    // TODO: Set properties to paint

    var path = Path();
    path.moveTo(size.width / 4, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    // TODO: Draw your path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}