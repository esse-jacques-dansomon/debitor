import 'dart:ffi';

import 'package:get/get.dart';
import '../../../data/model/debt_model.dart';
import '../../../data/provider/debt_provider.dart';
import '../../auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  final DebtProvider debtProvider;
  final AuthController authController;
  HomeController({required this.debtProvider, required this.authController});

  final debts = RxList<Debt>();

  @override
  onInit()  {
    super.onInit();
    getShopperDebts();
    print("onInit");
  }

  void getShopperDebts() async {
     var user = authController.user.value;
     if(user == null){
       print("user is null in getShopperDebts");
       return;
     }
     print("user $user in getShopperDebts");
     var shopperDebts = await debtProvider.getShopperDebts(user.id.toString());
     print(shopperDebts);
     debts.addAll(shopperDebts);
   }

   double getBalance(){
     var balance = 0.0;
     for(var debt in debts){
       if(!debt.paid){
         balance += debt.amount;
       }
     }
     return balance;
   }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }


}
