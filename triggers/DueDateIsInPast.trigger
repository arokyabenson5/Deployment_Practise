trigger DueDateIsInPast on Task (before insert) {
    if(Trigger.isBefore || Trigger.isInsert){
        if(!Trigger.new.isEmpty()){
            for(Task t : Trigger.new){
                if(t.ActivityDate < date.today()){
                    t.addError('Due Date cant be previous date');
                }
            }
        }
    }

}