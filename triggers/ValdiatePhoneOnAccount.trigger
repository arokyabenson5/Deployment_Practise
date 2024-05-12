trigger ValdiatePhoneOnAccount on Account (before insert) {
    if(!Trigger.new.isEmpty()){
    for(Account acc : Trigger.new){
        if(acc.Phone == Null || acc.phone == ''){
            acc.addError('Please enter the phone number');
        }
       
    	}
    }			
}