import 'package:qfinity/export.dart';

class InnerPageLayout extends StatelessWidget {
  final String? pageTitle;
  final Widget? child;

  const InnerPageLayout({super.key, this.child, this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (BuildContext context, _, screenMT) {
        return Scaffold(
          appBar: AppBar(
            title: MyText.titleMedium(
              pageTitle ?? '',
              fontWeight: 600,
            ),
            centerTitle: true,
          ),
          body: screenMT.isMobile ? mobileScreen(context) : largeScreen(context),
        );
      },
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Container(
      padding: MySpacing.all(16),
      height: MediaQuery.of(context).size.height,
      color: theme.cardTheme.color,
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MyFlex(
        wrapAlignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 0,
        runSpacing: 0,
        children: [
          MyFlexItem(
            sizes: 'xxl-6 lg-6 md-9 sm-10',
            child: MyCard(
              paddingAll: 20,
              child: child ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}
