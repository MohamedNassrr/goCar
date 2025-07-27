import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerGenerator {
  static Future<BitmapDescriptor> createGoogleMapsUserDot({
    // EXACT Google Maps dimensions (based on Material Design specs)
    double dotSize = 14.0,           // Inner blue dot: 14dp
    double whiteBorderSize = 18.0,   // White border: 18dp (2dp border)
    double accuracyRingSize = 30.0,  // Default accuracy ring: 40dp+

    // Official Google Colors
    Color dotColor = const Color(0xFF1A73E8),      // Google Blue 500
    Color ringColor = const Color(0xFF4285F4),     // Google Blue 400 (lighter)
    Color borderColor = Colors.white,

    double pixelRatio = 3.0,
    double? accuracyInMeters, // If provided, scales the ring
  }) async {

    // Calculate actual ring size based on accuracy (if provided)
    double actualRingSize = accuracyRingSize;
    if (accuracyInMeters != null) {
      // Scale ring based on accuracy (approximate)
      actualRingSize = (accuracyInMeters * 0.5).clamp(30.0, 120.0);
    }

    final canvasSize = (actualRingSize * pixelRatio * 1.2).toInt();
    final center = canvasSize / 2.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high;

    // 1. Draw accuracy ring (semi-transparent blue)
    paint.color = ringColor.withOpacity(0.15); // Very light
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center, center),
      (actualRingSize * pixelRatio) / 2,
      paint,
    );

    // 2. Draw accuracy ring border
    paint.color = ringColor.withOpacity(0.25);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0 * pixelRatio;
    canvas.drawCircle(
      Offset(center, center),
      (actualRingSize * pixelRatio) / 2,
      paint,
    );

    // 3. Draw white border (18dp total)
    paint.color = borderColor;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center, center),
      (whiteBorderSize * pixelRatio) / 2,
      paint,
    );

    // 4. Draw main blue dot (14dp)
    paint.color = dotColor;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center, center),
      (dotSize * pixelRatio) / 2,
      paint,
    );

    final picture = recorder.endRecording();
    final img = await picture.toImage(canvasSize, canvasSize);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}