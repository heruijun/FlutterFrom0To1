import '../BankService/service/bank_service_register.dart';
 
class ServiceLoader{
  static void load(){
    BankServiceRegister.register();
  }
}