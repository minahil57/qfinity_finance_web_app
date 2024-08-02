import 'package:qfinity/export.dart';

class ResponsiveLabeledItem extends StatelessWidget {
  const ResponsiveLabeledItem({
    super.key,
    required this.label,
    required this.child,
  });

  final Widget label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (_, __, type) {
        return type.isMobile || type.isTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label,
                  const SizedBox(height: 4),
                  child,
                  MySpacing.height(8),
                ],
              )
            : Row(
                children: [
                  label,
                  const SizedBox(width: 8),
                  Expanded(
                    child: child,
                  ),
                ],
              );
      },
    );
  }
}
