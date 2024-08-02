import 'package:qfinity/export.dart';

class ExportMenu<T extends ExportMixin> extends StatelessWidget {
  const ExportMenu({
    super.key,
    this.isSecond = false,
  });

  final bool isSecond;

  @override
  Widget build(BuildContext context) {
    Function? exportMenuHideFn;
    return GetBuilder<T>(
      builder: (controller) {
        return CustomPopupMenu(
          hideFn: (fn) => exportMenuHideFn = fn,
          backdrop: true,
          menu: MyContainer.bordered(
            color: UIConstants.contentTheme.secondary,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 7, left: 12),
                  child: const Icon(
                    FontAwesomeIcons.lightFileExport,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: MyText.labelSmall(
                    'Export As',
                    color: Colors.white,
                  ),
                ),
                ChevronDownIcon(color: Colors.white),
              ],
            ),
          ),
          menuBuilder: (_) => MyContainer.bordered(
            paddingAll: 0,
            width: 150,
            child: Padding(
              padding: MySpacing.xy(8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyButton(
                    onPressed: () {
                      exportMenuHideFn!.call();
                      if (isSecond) {
                        controller.secondExport(fileType: ExportedFileType.pdf);
                      } else {
                        controller.export(fileType: ExportedFileType.pdf);
                      }
                    },
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    padding: MySpacing.xy(8, 4),
                    splashColor: theme.colorScheme.onSurface.withAlpha(20),
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.lightFilePdf,
                          size: 14,
                          color: UIConstants.contentTheme.onBackground,
                        ),
                        MySpacing.width(8),
                        const MyText.labelMedium(
                          'PDF',
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(4),
                  MyButton(
                    onPressed: () {
                      exportMenuHideFn!.call();
                      if (isSecond) {
                        controller.secondExport(
                          fileType: ExportedFileType.word,
                        );
                      } else {
                        controller.export(fileType: ExportedFileType.word);
                      }
                    },
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    padding: MySpacing.xy(8, 4),
                    splashColor: theme.colorScheme.onSurface.withAlpha(20),
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.lightFileWord,
                          size: 14,
                          color: UIConstants.contentTheme.onBackground,
                        ),
                        MySpacing.width(8),
                        const MyText.labelMedium(
                          'WORD',
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(4),
                  MyButton(
                    onPressed: () {
                      exportMenuHideFn!.call();
                      if (isSecond) {
                        controller.secondExport(
                          fileType: ExportedFileType.excel,
                        );
                      } else {
                        controller.export(fileType: ExportedFileType.excel);
                      }
                    },
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    padding: MySpacing.xy(8, 4),
                    splashColor: theme.colorScheme.onSurface.withAlpha(20),
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.lightFileExcel,
                          size: 14,
                          color: UIConstants.contentTheme.onBackground,
                        ),
                        MySpacing.width(8),
                        const MyText.labelMedium(
                          'EXCEL',
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
