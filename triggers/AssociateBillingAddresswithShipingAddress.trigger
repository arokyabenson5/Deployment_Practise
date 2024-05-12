trigger AssociateBillingAddresswithShipingAddress on Account (before insert) {
    if(Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate)){
        if(!trigger.new.isEmpty()){
            for(Account a : Trigger.new){
                if(a.BillingAddress != Null || a.BillingCity != Null || a.BillingCountry != Null || a.BillingState != Null || a.BillingStreet != Null){
                  //  a.ShippingAddress = a.BillingAddress;
                    a.ShippingCity = a.BillingCity;
                    a.ShippingState = a.BillingState;
                    a.ShippingStreet = a.BillingStreet;
                }
            }
        }
    }
    
        

}