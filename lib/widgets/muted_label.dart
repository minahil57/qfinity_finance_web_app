import 'package:qfinity/export.dart';

class MutedLabel extends StatelessWidget {
  const MutedLabel({
    super.key,
    required this.label,
    this.isMuted,
    this.labelColor,
  });

  final String label;
  final Color? labelColor;
  final bool? isMuted;

  @override
  Widget build(BuildContext context) {
    Color finalColor = labelColor ?? theme.colorScheme.onSurface;
    finalColor = (isMuted ?? true ? finalColor.withAlpha(200) : finalColor);
    return MyResponsive(
      builder: (_, __, type) {
        return SizedBox(
          width: type.isMobile || type.isTablet ? double.infinity : Get.size.width * 0.07,
          child: AutoSizeText(
            label,
            maxLines: 1,
            maxFontSize: 12,
            minFontSize: 8,
            style: TextStyle(
              color: finalColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
