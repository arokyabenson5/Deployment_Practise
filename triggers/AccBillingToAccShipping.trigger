trigger AccBillingToAccShipping on Account (before insert) {
    for(Account acc : Trigger.new){
        if(acc.BillingState != null){
            acc.ShippingState = acc.BillingState;
        }
        if(acc.BillingCountry != null){
            acc.ShippingCountry = acc.BillingCountry;
        }
        if(acc.BillingCity != null){
            acc.ShippingCity = acc.BillingCity;
        }
      
    }
}