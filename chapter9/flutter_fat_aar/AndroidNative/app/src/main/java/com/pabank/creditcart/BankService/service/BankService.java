package com.pabank.creditcart.BankService.service;

import java.util.HashMap;
import java.util.Map;

import fleamarket.taobao.com.xservicekit.service.ServiceTemplate;
import fleamarket.taobao.com.xservicekit.service.ServiceGateway;
import io.flutter.plugin.common.MethodChannel;
import fleamarket.taobao.com.xservicekit.handler.MessageResult;

public class BankService {
    private static final ServiceTemplate mService  = new ServiceTemplate("BankService");
    public static ServiceTemplate getService(){
        return mService;
    }
    public static void register(){
        ServiceGateway.sharedInstance().addService(mService);
    }
    public static void MessageToFlutter(final MessageResult<Map> result, String message){
        Map<String,Object> args = new HashMap<>();
        args.put("message",message);
        mService.invoke("MessageToFlutter", args, mService.methodChannelName(), new MethodChannel.Result() {
            @Override
            public void success(Object o) {
                if (o instanceof  Map){
                    result.success((Map)o);
                }else{
                    result.error("return type error code dart code","","");
                }
            }
            
            @Override
            public void error(String s, String s1, Object o) {
                if (result != null){
                    result.error(s,s1,o);
                }
            }
            
            @Override
            public void notImplemented() {
                if (result != null){
                    result.notImplemented();
                }
            }
        });
    }
}
