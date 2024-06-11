trigger PaymentCardTrigger on Payment_Details__c (before insert,before update, before delete,after insert, after update, after delete, after undelete)  {

    if(Trigger.isInsert && Trigger.isBefore){
    
        for(Payment_Details__c  pd :Trigger.new){
            pd.External_ID__c = PaymentUtility.generateTransactionID();//external ID olusturuyrz
        }        
    }
    
    
    if(Trigger.isInsert && Trigger.isAfter){
    
        for(Payment_Details__c  pd :Trigger.new){
             PaymentCard.AddPaymentCard(pd.External_ID__c, pd.Card_Number__c, pd.CVV__c, pd.Expiration_Date__c);
        }        
    }

    
    
    if(Trigger.isUpdate && Trigger.isAfter){
    
        for(Payment_Details__c  pd :Trigger.new){
             PaymentCard.UpdatePaymentCard(pd.External_ID__c, pd.Card_Number__c, pd.CVV__c, pd.Expiration_Date__c);
        }        
    }


      if(Trigger.isDelete && Trigger.isAfter){
    
        for(Payment_Details__c  pd :Trigger.old){
             PaymentCard.DeletePaymentCard(pd.External_ID__c);
        }        
    }
    
    
    
    
}