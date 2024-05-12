trigger TotalContactsOnAccount on Contact (after insert, after update, after delete ,after undelete) {
    set<Id> conIds = new set<Id>();
    if(trigger.isAfter &&(trigger.isInsert || trigger.isupdate)){
        if(!Trigger.new.isEmpty()){
            for(Contact con : Trigger.new){
                if(con.AccountId != null){
                    conIds.add(con.Id);
                }
            }
        }
    }
    if(Trigger.isAfter && trigger.isUndelete){
        if(!Trigger.new.isEmpty()){
            for(Contact con : Trigger.new){
              	if(con.Id != trigger.oldMap.get(con.Id).AccountId){
               	 	conIds.add(con.Id);
               	 	conIds.add(trigger.oldMap.get(con.Id).AccountId);
                }
            }
        }
            
    }
    if(!Trigger.old.isEmpty()){
        for(Contact con : Trigger.old){
            if(con.AccountId != null){
                conIds.add(con.Id);
            }
        }
    }
    
    
    if(!conIds.isEmpty()){
        List<Account> accList = [Select id,	Number_Of_Contacts__c,(Select id from Contacts)from Account where Id IN: conIds];
        
        if(!accList.isEmpty()){
            For(Account acc : accList){
                
                
                
            }
        }
        
        
    }
}