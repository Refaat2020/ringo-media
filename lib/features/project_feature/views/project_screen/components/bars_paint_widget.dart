import 'package:ringo_media/core/config/app_route.dart';

import '../../../../../file_export.dart';

class BarChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final int? touchedIndex;

  BarChartPainter(this.data, this.labels, this.touchedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = 44.0.w;
    final spacing = 6.0.w;
    final maxData = data.reduce((a, b) => a > b ? a : b);

    final Paint barPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColors.neutralColors50;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < data.length; i++) {
      final left = i * (barWidth + spacing);
      final top = size.height - (data[i] / maxData * size.height);
      final right = left + barWidth;
      final bottom = size.height;

      final RRect barRect = RRect.fromRectAndCorners(
        Rect.fromLTRB(left, top, right, bottom),
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      );
      barPaint.color = i == touchedIndex ? Colors.black : Colors.grey.shade300;
      final rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawRRect(barRect, barPaint);

      // Draw labels
      textPainter.text = TextSpan(
        text: labels[i],
        style: Theme.of(navigatorKey.currentContext!)
            .textTheme
            .bodySmall
            ?.copyWith(
                color: touchedIndex == i
                    ? AppColors.neutralColors900
                    : AppColors.neutralColors500,
                fontVariations: [const FontVariation.weight(500)]),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(left + (barWidth - textPainter.width) / 2, size.height + 10),
      );

      if (i == touchedIndex) {
        _drawTooltip(canvas, size, rect, '${data[i].toInt()} %');
      }
    }
  }

  void _drawTooltip(Canvas canvas, Size size, Rect rect, String text) {
    const tooltipHeight = 30.0;
    const tooltipWidth = 50.0;
    final tooltipPaint = Paint()
      ..color = AppColors.neutralColors900
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(rect.center.dx - tooltipWidth / 2, rect.top - tooltipHeight - 10)
      ..lineTo(rect.center.dx + tooltipWidth / 2, rect.top - tooltipHeight - 10)
      ..lineTo(rect.center.dx + tooltipWidth / 2, rect.top - 10)
      ..lineTo(rect.center.dx, rect.top)
      ..lineTo(rect.center.dx - tooltipWidth / 2, rect.top - 10)
      ..close();

    canvas.drawPath(path, tooltipPaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Theme.of(navigatorKey.currentContext!)
            .textTheme
            .bodyLarge
            ?.copyWith(
          color: AppColors.neutralColors0,
          fontVariations: [const FontVariation.weight(500)],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        rect.center.dx - textPainter.width / 2,
        rect.top - tooltipHeight - 10 + 8,
      ),
    );
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    return oldDelegate.touchedIndex != touchedIndex;
  }
}
