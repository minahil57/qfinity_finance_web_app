import 'package:qfinity/export.dart';

class PrintPage<T extends ExportMixin> extends StatelessWidget {
  const PrintPage({
    super.key,
    required this.title,
    this.popLevel = 1,
  });

  final String title;
  final int popLevel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              centerTitle: false,
              actions: [
                Container(
                  width: 160,
                  padding: const EdgeInsets.only(right: 10),
                  child: ExportMenu<T>(),
                ),
              ],
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.chevronLeft),
                onPressed: () {
                  for (var i = 0; i < popLevel; i++) {
                    Get.back();
                  }
                },
              ),
            ),
            body: Center(
              child: SizedBox(
                width: SizeUtils.pdfDisplayWidth,
                child: SfPdfViewer.network(
                  controller.fileUrl!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
