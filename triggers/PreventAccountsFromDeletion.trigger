trigger PreventAccountsFromDeletion on Account (before delete) {
    List<Id> accList = new List<Id>();    
    for(Account acc : [SELECT id,(Select id from Contacts) from Account where id IN : Trigger.old]){
        if(acc.Contacts.size() > 2){
            accList.add(acc.Id);
        }
    }
    if(!accList.isEmpty()){
        for(Id accId : accList){
            Account acc = Trigger.oldMap.get(accId);
            acc.addError('Cant be deleted');
        }
    }
}