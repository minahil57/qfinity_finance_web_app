import 'package:qfinity/export.dart';

class StarterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      StarterController(),
      permanent: true,
    );
  }
}
