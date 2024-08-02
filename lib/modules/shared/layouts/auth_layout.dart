import 'package:qfinity/export.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (BuildContext context, _, screenMT) {
        return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile ? mobileScreen(context) : largeScreen(context);
          },
        );
      },
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: controller.scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: [
          const Center(
            child: Opacity(
              opacity: 0.99,
              child: BlurHash(hash: 'LDLz?TMI00%N00I=M{%M00Rj~qRP'),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: MyFlex(
                  wrapAlignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 0,
                  runSpacing: 0,
                  children: [
                    MyFlexItem(
                      sizes: 'xxl-8 lg-8 md-9 sm-10',
                      child: MyContainer(
                        paddingAll: 0,
                        color: AdminTheme.theme.contentTheme.background.withAlpha(230),
                        child: child ?? Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
