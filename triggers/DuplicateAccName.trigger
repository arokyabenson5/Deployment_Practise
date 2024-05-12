trigger DuplicateAccName on Account (before insert) {
        
    for(Account a: Trigger.new){
        for(Account a1:[select name from Account]){
            if(a.Name == a1.Name ){
                a.addError('The name Already Exists');
            }
        }
    }
  
}