import 'package:qfinity/export.dart';

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const NavigationItem({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  });

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = Get.currentRoute == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          if (Get.currentRoute != widget.route) {
            if (widget.route == Routes.dashboard) {
              Get.offAllNamed(widget.route!);
            } else {
              // remove all routes except dashboard and stack that route over dashboard
              Get.offAllNamed(
                widget.route!,
                predicate: (r) => r.settings.name == Routes.dashboard,
              );
            }
          }
        }
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
          color: isActive || isHover ? UIConstants.leftBarTheme.activeItemBackground : Colors.transparent,
          padding: MySpacing.xy(8, 8),
          child: Row(
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: (isHover || isActive)
                        ? UIConstants.leftBarTheme.activeItemColor
                        : UIConstants.leftBarTheme.onBackground,
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
                    color: isActive || isHover
                        ? UIConstants.leftBarTheme.activeItemColor
                        : UIConstants.leftBarTheme.onBackground,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
