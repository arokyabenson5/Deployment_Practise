trigger DoctorToPatient on Patient__c (before insert) {
    List<Doctor__c> d = new List<Doctor__c>();
    for(Patient__c patient: Trigger.new){
        if(patient.Patient_Diagnosis__c=='General Physician'){
            d = [SELECT name FROM Doctor__c where Speciality__c='General Physician'];
         
            patient.Doctor__c = 'Ramya';
        }
       
    }

}