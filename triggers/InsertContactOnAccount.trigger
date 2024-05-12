trigger InsertContactOnAccount on Account (before Insert) {

    List<Contact> conList = new List<Contact>();
    if(trigger.isBefore && trigger.isInsert){
        if(!Trigger.new.isEmpty()){
            for(Account acc : Trigger.new){
                if(acc.ContactCount__c != null && acc.ContactCount__c >0){
                    Contact con = new Contact(); 
                    for(integer i=0; i <=acc.ContactCount__c ;i++ ){
                        con.FirstName = 'Test'+(i+1);
                        con.LastName = acc.Name +(i+2);
                        //con.AccountId=acc.Id;
                        conList.add(con);
                    }
                }
            }
            
        }
    }
    if(!conList.isEmpty()){
        insert conList;
    }

}