trigger AccountCustom on Account (before insert,before update) {
    for(Account acc : Trigger.New){
        if(acc.Rating == 'Hot'){
            acc.Ownership = 'Public';
        }
    }
    

}