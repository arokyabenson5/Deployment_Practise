trigger AnnualRevenueUpdateTrigger on Account (before insert,before update) {
    if(trigger.isbefore && (trigger.isAfter || trigger.isUpdate)){
        if(!trigger.new.isEmpty()){
            for(Account acc : trigger.new ){
                if(acc.Industry == 'Banking'){
                    acc.AnnualRevenue = 5000000;
                }
                 else if(acc.Industry == 'Finance'){
                    acc.AnnualRevenue = 4000000;
                }
                else if(acc.Industry == 'Insurance'){
                    acc.AnnualRevenue = 3000000;
                }
                 else if(acc.Industry == 'Healthcare'){
                    acc.AnnualRevenue = 2500000;
                }
                else{
                    acc.AnnualRevenue =200000;
                }
                
                
                
            }
        }
    }

}