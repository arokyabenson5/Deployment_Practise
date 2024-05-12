trigger MES_Trigger on MES__c (before insert,before update) {
    Id queueId = [Select Id from group where type = 'QUEUE' and name = 'MES Order Management Support'].Id;

    for(MES__c obj : Trigger.new){
        
        if(obj.Expedite__c == True){
            obj.OwnerId = queueId;
        }
            else if(obj.Expedite__c == False){
            		
                obj.OwnerId = UserInfo.getUserId();
            }


        }

    
}