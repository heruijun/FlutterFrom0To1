package com.pabank.creditcart.BankService.service;

import com.pabank.creditcart.BankService.handlers.*;

public class BankServiceRegister {
    public static void register(){
        BankService.register();
        BankService_MessageToNative.register();
    }
}
