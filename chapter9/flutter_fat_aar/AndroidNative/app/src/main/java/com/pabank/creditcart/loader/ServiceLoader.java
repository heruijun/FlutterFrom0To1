package com.pabank.creditcart.loader;

import com.pabank.creditcart.BankService.service.*;

public class ServiceLoader {
    public static void load(){
        BankServiceRegister.register();
    }
}
