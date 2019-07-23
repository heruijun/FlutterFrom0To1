
 import 'bank_service.dart';
 import '../handlers/bank_service_message_to_flutter.dart'; 
 
 class BankServiceRegister{
 
  static void register(){
      BankService.regsiter();
      BankServiceMessageToFlutter.regsiter();
   }
 
 }