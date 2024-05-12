trigger triggerPhoneCheck on Account (before insert,before update) {
        for(Account acc : trigger.new) {
            if (String.isBlank(acc.Phone)) {
            acc.adderror('Please add a Phone Number.');
}
}
}