import 'package:flutter/material.dart';
import 'dart:ui' as ui show lerpDouble;

class CustomRoundedRectangleBorder extends ShapeBorder {

  final double borderWidth;
  final BorderRadius borderRadius;

  const CustomRoundedRectangleBorder({
    this.borderWidth: 1.0,
    this.borderRadius: BorderRadius.zero,
  })
      : assert(borderRadius != null);

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(borderWidth);
  }

  @override
  ShapeBorder scale(double t) {
    return new CustomRoundedRectangleBorder(
      borderWidth: borderWidth * (t),
      borderRadius: borderRadius * (t),
    );
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    assert(t != null);
    if (a is CustomRoundedRectangleBorder) {
      return new CustomRoundedRectangleBorder(
        borderWidth: ui.lerpDouble(a.borderWidth, borderWidth, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    assert(t != null);
    if (b is CustomRoundedRectangleBorder) {
      return new CustomRoundedRectangleBorder(
        borderWidth: ui.lerpDouble(borderWidth, b.borderWidth, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, { TextDirection textDirection }) {
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect).deflate(
          borderWidth));
  }

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {
    rect = rect.deflate(borderWidth / 2.0);

    Paint paint;
    final RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);
    paint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawRRect(borderRect, paint);
  }
}