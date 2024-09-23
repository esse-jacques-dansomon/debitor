import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:shopapp/app/routes/app_pages.dart';
import 'package:shopapp/app/widgets/network_error_item.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
      (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(List<ConnectivityResult> status) {
    if (status.contains(ConnectivityResult.mobile) ||
        status.contains(ConnectivityResult.wifi)) {
      if (Get.isDialogOpen == false) {
        Get.offNamedUntil(Routes.SPLASH, (_) => false);
      }
    }
    else {
      if (Get.isDialogOpen == false) {
        Get.dialog(NetworkErrorItem(), useSafeArea: false);
      }
    }
  }
}
