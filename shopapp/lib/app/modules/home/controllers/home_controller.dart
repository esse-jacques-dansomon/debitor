import 'package:get/get.dart';
import '../../../data/model/debt_model.dart';
import '../../../data/repository/debt_repository.dart';
import '../../auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  final DebtRepository debtProvider;
  final AuthController authController;
  HomeController({required this.debtProvider, required this.authController});

  final debts = RxList<Debt>();

  @override
  onInit()  {
    super.onInit();
   // getShopperDebts();
  }

  Future<void> getShopperDebts() async {
     var user = authController.user.value;
     if(user == null){
       return;
     }
     var shopperDebts = await debtProvider.getShopperDebts(user.id.toString());
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
}
