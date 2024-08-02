import 'package:qfinity/export.dart';

class MyResponsive extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, MyScreenMediaType) builder;

  const MyResponsive({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(
          context,
          constraints,
          MyScreenMedia.getTypeFromWidth(
            MediaQuery.of(context).size.width,
          ),
        );
      },
    );
  }
}
