import 'package:flutter/material.dart';

// Sourced from: https://stackoverflow.com/questions/52152018/cut-out-text-effect-in-flutter
class CutOutTextPainter extends CustomPainter {
  CutOutTextPainter({required this.text, required this.backgroundColor}) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    _textPainter.layout();
  }

  final String text;
  final Color backgroundColor;
  late final TextPainter _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter.size.center(Offset.zero);
    final textRect = textOffset & _textPainter.size;

    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect = RRect.fromRectAndRadius(
        textRect.inflate(10.0), const Radius.circular(4.0));
    final boxPaint = Paint()
      ..color = backgroundColor
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());

    _textPainter.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CutOutTextPainter oldDelegate) {
    return text != oldDelegate.text;
  }
}
