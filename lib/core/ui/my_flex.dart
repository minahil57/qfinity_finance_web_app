import 'package:qfinity/export.dart';

class MyFlex extends StatelessWidget {
  final List<MyFlexItem> children;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;
  final WrapAlignment runAlignment;
  final bool contentPadding;

  final double? spacing;
  final double? runSpacing;

  const MyFlex({
    super.key,
    required this.children,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.contentPadding = true,
    this.spacing,
    this.runSpacing,
  });

  EdgeInsets getPadding(int index, int length) {
    if (contentPadding) {
      return MySpacing.x((spacing ?? flexSpacing) / 2);
    } else {
      return MySpacing.fromLTRB(
        index == 0 ? 0 : (spacing ?? flexSpacing) / 2,
        0,
        index == length - 1 ? 0 : (spacing ?? flexSpacing) / 2,
        0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (BuildContext context, BoxConstraints constraints, screenMediaType) {
        double width = constraints.maxWidth;
        List<Widget> list = [];
        for (final List<MyFlexItem> lCol in getGrouped(screenMediaType)) {
          list.addAll(
            lCol.mapIndexed(
              (index, col) => Container(
                width: getWidthFromFlex(
                  width,
                  col.flex[screenMediaType] ?? MyScreenMedia.flexColumns,
                  lCol.length,
                  spacing ?? flexSpacing,
                ),
                padding: getPadding(index, lCol.length),
                child: col,
              ),
            ),
          );
        }
        return Wrap(
          crossAxisAlignment: wrapCrossAlignment,
          alignment: wrapAlignment,
          runAlignment: runAlignment,
          runSpacing: runSpacing ?? flexSpacing,
          spacing: spacing ?? 0,
          children: list,
        );
      },
    );
  }

  List<List<MyFlexItem>> getGrouped(MyScreenMediaType type) {
    List<List<MyFlexItem>> list = [];
    var flexCount = 0;
    List<MyFlexItem> iList = [];
    for (final MyFlexItem col in children) {
      if (col.display[type]!.isBlock) {
        int flex = col.flex[type]!;
        if (flexCount + flex <= 12) {
          iList.add(col);
          flexCount += flex;
        } else {
          list.add(iList);
          iList = [col];
          flexCount = 0;
        }
      }
    }
    if (iList.isNotEmpty) {
      list.add(iList);
    }
    return list;
  }

  double getWidthFromFlex(double width, int flex, int items, double spacing) {
    return (width * flex / MyScreenMedia.flexColumns).floorToDouble();
  }
}
