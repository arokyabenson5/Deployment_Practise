trigger Acctrigger on Opportunity (after update) {
    AccntTrigger.updateopportunities(trigger.new);

}