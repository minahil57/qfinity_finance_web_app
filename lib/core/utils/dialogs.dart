import 'package:qfinity/export.dart';

abstract final class Dialogs {
  static void deleteConfirmation({required Function onConfirm}) {
    Get.defaultDialog(
      title: 'Delete',
      middleText: 'Are you sure you want to delete this item?',
      contentPadding: const EdgeInsets.all(16),
      cancel: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(UIConstants.contentTheme.secondary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppStyle.buttonRadius.medium),
            ),
          ),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text('No'),
      ),
      confirm: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(UIConstants.contentTheme.danger),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppStyle.buttonRadius.medium),
            ),
          ),
        ),
        onPressed: () async {
          Get
            ..closeAllSnackbars()
            ..close(1);
          EasyLoading.show(
            status: 'Deleting...',
            maskType: EasyLoadingMaskType.black,
          );
          await onConfirm();
          EasyLoading.dismiss();
        },
        child: const Text('Yes'),
      ),
      radius: AppStyle.buttonRadius.large,
    );
  }
}
