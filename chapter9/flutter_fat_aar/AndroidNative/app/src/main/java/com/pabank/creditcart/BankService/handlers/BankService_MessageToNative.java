package com.pabank.creditcart.BankService.handlers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import fleamarket.taobao.com.xservicekit.handler.MessageHandler;
import fleamarket.taobao.com.xservicekit.handler.MessageResult;
import fleamarket.taobao.com.xservicekit.service.ServiceGateway;

public class BankService_MessageToNative implements MessageHandler<Boolean>{
    private Object mContext = null;
    private boolean onCall(MessageResult<Boolean> result,String message){
        //Add your handler code here.
        return true;
    }
    
    //==================Do not edit code blow!==============
    @Override
    public boolean onMethodCall(String name, Map args, MessageResult<Boolean> result) {
        this.onCall(result,(String)args.get("message"));
        return  true;
    }
    @Override
    public List<String> handleMessageNames() {
        List<String> h = new ArrayList<>();
        h.add("MessageToNative");
        return h;
    }
    @Override
    public Object getContext() {
        return mContext;
    }
    
    @Override
    public void setContext(Object obj) {
        mContext = obj;
    }
    @Override
    public String service() {
        return "BankService";
    }
    public static void register(){
        ServiceGateway.sharedInstance().registerHandler(new BankService_MessageToNative());
    }
}
