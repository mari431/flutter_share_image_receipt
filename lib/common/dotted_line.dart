import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final double gap;
  final double dashWidth;
  final Color color;

  DottedLinePainter({this.gap = 5.0, this.dashWidth = 5.0, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    final space = gap + dashWidth;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double gap;
  final Color color;

  DottedLine({this.height = 1.0, this.dashWidth = 5.0, this.gap = 5.0, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: DottedLinePainter(
        dashWidth: dashWidth,
        gap: gap,
        color: color,
      ),
    );
  }
}