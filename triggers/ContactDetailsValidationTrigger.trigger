trigger ContactDetailsValidationTrigger on Contact (before insert,before update) {
    if(trigger.isBefore &&(trigger.isInsert || trigger.isUpdate)){
        if(!trigger.new.isEmpty()){
           /* for(Contact con : Trigger.new){
                if(con.Email == null || con.Email == ''){
                    con.email.AddError('Email is mandatory');
                }
                else if(con.Phone == null || con.Phone == ''){
                    con.Phone.AddError('Phone number is mandatory');
               
                }
                
            }*/
            
        }
    }

}