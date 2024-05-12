trigger PatientDescTrigger on Patient__c (before insert) {
    for(Patient__c pat:Trigger.new){
        if(pat.Stage__c == 'critical'){
            pat.Description__c ='Patient to be Admitted in ICU';
        }
        
    }

}