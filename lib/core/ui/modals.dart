import 'package:qfinity/export.dart';

abstract final class Modals {
  static void formModal({
    required Widget form,
  }) {
    double screenHeight = SizeUtils.screenHeight;
    final double modalWidth = SizeUtils.modalWidth;

    final modalMaxHeight = screenHeight * 0.8;

    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: modalMaxHeight),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 40,
                      bottom: 20,
                    ),
                    width: modalWidth,
                    child: form,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: const Icon(FontAwesomeIcons.lightXmark, size: 18),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
