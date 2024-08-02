import 'package:qfinity/export.dart';

class ReportItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String url;

  const ReportItem({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    required this.url,
  });

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UrlService.goToUrl(widget.url);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(16, 0, 16, 8),
          color: isHover ? UIConstants.leftBarTheme.activeItemBackground : Colors.transparent,
          padding: MySpacing.xy(8, 8),
          child: Row(
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: isHover ? UIConstants.leftBarTheme.activeItemColor : UIConstants.leftBarTheme.onBackground,
                    size: 20,
                  ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  child: MySpacing.width(16),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: MyText.labelLarge(
                    widget.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    color: isHover ? UIConstants.leftBarTheme.activeItemColor : UIConstants.leftBarTheme.onBackground,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
