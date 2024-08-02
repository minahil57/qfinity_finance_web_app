import 'package:qfinity/export.dart';

class MenuWidget extends StatefulWidget implements MenuChild {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuChild> children;
  final GlobalKey<CustomPopupMenuState>? popupMenuKey;
  @override
  final String? route;

  const MenuWidget({
    super.key,
    this.popupMenuKey,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.active = false,
    this.children = const [],
    this.route,
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _controller.drive(
      Tween<double>(begin: 0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)),
    );
  }

  void onChangeExpansion(bool value) {
    if (value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkRouteRecursively(widget.children);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
  }

  void checkRouteRecursively(List<MenuChild> children) {
    for (final e in children) {
      if (e is MenuItem) {
        if (e.route == Get.currentRoute) {
          isActive = true;
          return;
        }
      } else if (e is MenuWidget) {
        checkRouteRecursively(e.children);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isCondensed) {
      return CustomPopupMenu(
        key: widget.popupMenuKey,
        backdrop: true,
        show: popupShowing,
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
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
            margin: MySpacing.fromLTRB(
              widget.iconData != null ? 16 : 0,
              0,
              widget.iconData != null ? 16 : 0,
              widget.iconData != null ? 8 : 4,
            ),
            color: isActive || isHover ? UIConstants.leftBarTheme.activeItemBackground : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: widget.iconData != null
                ? Center(
                    child: Icon(
                      widget.iconData,
                      color: (isHover || isActive)
                          ? UIConstants.leftBarTheme.activeItemColor
                          : UIConstants.leftBarTheme.onBackground,
                      size: 20,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MyText.labelLarge(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          color: isActive || isHover
                              ? UIConstants.leftBarTheme.activeItemColor
                              : UIConstants.leftBarTheme.onBackground,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.lightChevronRight,
                        size: 12,
                        color: isActive || isHover
                            ? UIConstants.leftBarTheme.activeItemColor
                            : UIConstants.leftBarTheme.onBackground,
                      ),
                    ],
                  ),
          ),
        ),
        menuBuilder: (_) => MyContainer.bordered(
          padding: const EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children.map((e) {
              if (e is MenuWidget) {
                return MenuWidget(
                  popupMenuKey: e.popupMenuKey,
                  iconData: e.iconData,
                  title: e.title,
                  isCondensed: e.isCondensed,
                  children: e.children,
                  active: e.active,
                );
              } else if (e is MenuItem) {
                return MenuItem(
                  parentMenuKeys: e.parentMenuKeys,
                  title: e.title,
                  isCondensed: e.isCondensed,
                  route: e.route,
                  iconData: e.iconData,
                );
              } else {
                return Container();
              }
            }).toList(),
          ),
        ),
      );
    } else {
      return MouseRegion(
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
          margin: MySpacing.fromLTRB(
            widget.iconData != null ? 24 : 8,
            0,
            widget.iconData != null ? 16 : 8,
            0,
          ),
          paddingAll: 0,
          child: ListTileTheme(
            contentPadding: EdgeInsets.zero,
            dense: true,
            horizontalTitleGap: 0,
            minLeadingWidth: 0,
            child: ExpansionTile(
              tilePadding: MySpacing.zero,
              initiallyExpanded: isActive,
              maintainState: true,
              onExpansionChanged: onChangeExpansion,
              trailing: RotationTransition(
                turns: _iconTurns,
                child: Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 13,
                  color: UIConstants.leftBarTheme.onBackground,
                ),
              ),
              iconColor: UIConstants.leftBarTheme.activeItemColor,
              childrenPadding: MySpacing.x(0),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.iconData != null) ...[
                    Icon(
                      widget.iconData,
                      size: 20,
                      color: isHover || isActive
                          ? UIConstants.leftBarTheme.activeItemColor
                          : UIConstants.leftBarTheme.onBackground,
                    ),
                    MySpacing.width(18),
                  ] else
                    Text(
                      '-  ',
                      style: TextStyle(
                        color: isHover || isActive
                            ? UIConstants.leftBarTheme.activeItemColor
                            : UIConstants.leftBarTheme.onBackground,
                      ),
                    ),
                  Expanded(
                    child: MyText.labelLarge(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      color: isHover || isActive
                          ? UIConstants.leftBarTheme.activeItemColor
                          : UIConstants.leftBarTheme.onBackground,
                    ),
                  ),
                ],
              ),
              collapsedBackgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
              ),
              backgroundColor: Colors.transparent,
              children: widget.children.map((e) {
                if (e is MenuWidget) {
                  return MenuWidget(
                    iconData: e.iconData,
                    title: e.title,
                    isCondensed: e.isCondensed,
                    children: e.children,
                  );
                } else if (e is MenuItem) {
                  return MenuItem(
                    parentMenuKeys: e.parentMenuKeys,
                    title: e.title,
                    isCondensed: e.isCondensed,
                    route: e.route,
                  );
                } else {
                  return Container();
                }
              }).toList(),
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

typedef LeftbarMenuFunction = void Function(String key);

abstract class MenuChild {
  final String? route;

  const MenuChild({
    this.route,
  });
}
