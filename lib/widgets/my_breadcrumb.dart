import 'package:qfinity/export.dart';

class MyBreadcrumb extends StatelessWidget {
  final List<MyBreadcrumbItem> children;
  final bool hideOnMobile;

  const MyBreadcrumb({
    super.key,
    required this.children,
    this.hideOnMobile = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < children.length; i++) {
      var item = children[i];
      if (item.active || item.route == null) {
        list.add(
          MyText.labelMedium(
            children[i].name,
            fontWeight: 500,
            fontSize: 13,
            letterSpacing: 0,
          ),
        );
      } else {
        list.add(
          InkWell(
            onTap: () => {if (item.route != null) Get.offNamed(item.route!)},
            child: MyText.labelMedium(
              children[i].name,
              fontWeight: 500,
              fontSize: 13,
              letterSpacing: 0,
              color: theme.colorScheme.primary,
            ),
          ),
        );
      }
      if (i < children.length - 1) {
        list
          ..add(MySpacing.width(10))
          ..add(const MyText('>'))
          ..add(MySpacing.width(10));
      }
    }
    return MyResponsive(
      builder: (_, __, type) {
        return type.isMobile && hideOnMobile ? const SizedBox() : Row(mainAxisSize: MainAxisSize.min, children: list);
      },
    );
  }
}
