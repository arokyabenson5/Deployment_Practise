trigger CreateContactwithCheckBox on Account (after insert, after update) {
    List<Contact> updatedList = new List<Contact>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        if(!trigger.new.isEmpty()){
            for(Account acc : trigger.new){
                if(acc.CreateContact__c == true){
                    Contact con = new  Contact();
                   	con.FirstName = 'test';
                    con.LastName = acc.Name;
                    con.AccountId = acc.Id;
                    con.Phone = acc.Phone;
              
                updatedList.add(con);
                }
            }
        }
    }
    if(!updatedList.isEmpty())
        insert updatedList;

}