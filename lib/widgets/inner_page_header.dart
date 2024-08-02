import 'package:qfinity/export.dart';

class InnerPageHeader extends StatelessWidget {
  const InnerPageHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButton(),
        MySpacing.width(flexSpacing * .75),
        MyText.titleMedium(
          title,
          fontSize: 18,
        ),
      ],
    );
  }
}
