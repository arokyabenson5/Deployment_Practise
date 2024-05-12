trigger accPhoneToConPhone on Account (after update) {
    Map<id,account> accMap = new Map<id,account>();
    if(trigger.isAfter && Trigger.isUpdate){
        if(!Trigger.new.isEmpty()){
            for(Account acc : Trigger.new){
                if(acc.Phone != trigger.oldmap.get(acc.id).phone){
                    accMap.put(acc.id,acc);
                }
            }
        }
    }
    if(!accMap.isEmpty()){
        List<contact> conList = [SELECT Id,phone,AccountId FROM Contact where AccountId IN : accMap.keySet()];
        List<Contact> ListToUpdateContacts = new List<Contact>();
        if(!conList.isEmpty()){
            for(Contact con:conList){
               con.Phone =accMap.get(con.AccountId).Phone;
                ListToUpdateContacts.add(con);
            }
        }
        if(!ListToUpdateContacts.isEmpty()){
            try{
                update ListToUpdateContacts;
            }
            catch(exception ex){
					System.debug('Error while updating record-->'+ex.getMessage());
			}
        }
    }

}