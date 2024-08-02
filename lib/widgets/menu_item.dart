import 'package:qfinity/export.dart';

class MenuItem extends StatefulWidget implements MenuChild {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  @override
  final String? route;
  final List<GlobalKey<CustomPopupMenuState>> parentMenuKeys;

  const MenuItem({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
    required this.parentMenuKeys,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = Get.currentRoute == widget.route;
    return GestureDetector(
      onTap: () {
        for (final e in widget.parentMenuKeys) {
          e.currentState?.closeMenu();
        }

        if (widget.route != null) {
          // here we check if the pushed route is not the current route
          // TODO: handle pop the menu on mobile
          if (widget.route! != Get.currentRoute) {
            // remove all routes except dashboard and stack that route over dashboard
            Get.offAllNamed(
              widget.route!,
              predicate: (r) => r.settings.name == Routes.dashboard,
            );
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
          margin: MySpacing.fromLTRB(0, 0, 0, 4),
          color: isActive || isHover ? UIConstants.leftBarTheme.activeItemBackground : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: MySpacing.xy(8, 8),
          child: MyText.bodySmall(
            "${widget.isCondensed ? "" : "-  "}${widget.title}",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color:
                isActive || isHover ? UIConstants.leftBarTheme.activeItemColor : UIConstants.leftBarTheme.onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}
