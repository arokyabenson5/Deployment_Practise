trigger HMSTrigger on Room__c (before insert) {
Set<ID> IdOfNurse = new Set<ID>();
Set<ID> duplicateIdOfNurse= new Set<ID>();
for(Room__c room:trigger.new){
if(room.Nurse__c!= null){
IdOfNurse.add(room.Nurse__c);
}
}
if(IdOfNurse.size()>0){
for(Room__c room:[Select Nurse__c from Room__c where Nurse__c in:IdOfNurse]){
duplicateIdOfNurse.add(room.Nurse__c);
}
}
if(duplicateIdOfNurse.size() > 0){
for(Room__c room: trigger.new){
if(duplicateIdOfNurse.contains(room.Nurse__c)){
room.addError('Nurse already assigned');
}
}
}
}