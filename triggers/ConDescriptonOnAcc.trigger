trigger ConDescriptonOnAcc on Contact (After Update) {
    set<Id> accIds = new Set<Id>();
    if(Trigger.isAfter && Trigger.isUpdate){
        if(!Trigger.new.isEmpty()){
            for(Contact con : Trigger.new ){
                if(con.AccountId != Null && trigger.oldMap.get(con.Id).Description != con.Description){
                    accIds.add(con.AccountId);
                    
                }
            }
        }
    }     
        if(!accIds.isEmpty())	{       
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Description from Account where Id IN: accIds]);
        List<Account> updatedList = new List<Account>();
        if(!Trigger.new.isEmpty()){
            for(Contact cont : Trigger.new){
                Account acc = accMap.get(cont.AccountId);
                acc.Description = cont.Description;
                updatedList.add(acc);
            }
        
        }
        if(!updatedList.isEmpty()){
            update updatedList;
        }

        }
}