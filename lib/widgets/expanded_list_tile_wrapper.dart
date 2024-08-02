import 'package:qfinity/export.dart';

class ExpandedListTileWrapper extends StatelessWidget {
  const ExpandedListTileWrapper({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: MyContainer.bordered(
        borderRadiusAll: 5,
        paddingAll: 0,
        margin: const EdgeInsets.only(bottom: 7),
        child: ExpansionTile(
          iconColor: Colors.grey.shade400,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          childrenPadding: EdgeInsets.only(
            left: flexSpacing,
            right: flexSpacing,
            bottom: flexSpacing * .5,
            top: flexSpacing * .2,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          tilePadding: EdgeInsets.only(
            left: flexSpacing,
            right: flexSpacing,
          ),
          dense: true,
          children: children,
        ),
      ),
    );
  }
}
