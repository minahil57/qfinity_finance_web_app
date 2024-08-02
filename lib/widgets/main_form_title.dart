import 'package:qfinity/export.dart';

class MainFormTitle extends StatelessWidget {
  const MainFormTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.x(flexSpacing),
      child: MyText.titleMedium(
        title,
        fontWeight: 600,
      ),
    );
  }
}
