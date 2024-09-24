import 'package:get/get.dart';

import '../controllers/debt_details_controller.dart';

class DebtDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebtDetailsController>(
      () => DebtDetailsController(),
    );
  }
}
