import 'package:get/get.dart';

import '../controllers/debit_controller.dart';

class DebitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebitController>(
      () => DebitController(),
    );
  }
}
