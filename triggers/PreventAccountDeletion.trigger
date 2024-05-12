trigger PreventAccountDeletion on Account (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        ActiveAccountHandler.ActiveAccCantBeDeleted(Trigger.old);
    }

}