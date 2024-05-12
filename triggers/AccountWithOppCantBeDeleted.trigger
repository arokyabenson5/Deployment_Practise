trigger AccountWithOppCantBeDeleted on Account (before delete) {
  
    List<opportunity> OppList = [Select name from Opportunity where AccountId IN: Trigger.old];
        if(!OppList.isEmpty()){
            for(Account acc: Trigger.old){
                acc.addError('Hey....!Cant delete as it has OPP NEW');
            }
        }
}