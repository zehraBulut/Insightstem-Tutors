public class PaymentDetailsUtility {

    public static Payment_Details__c getPrimaryPaymentDetailByParentId(string parentId){
        
        List<Payment_Details__c> primaryPaymentDetails = [SELECT Id, Card_Number__c, CVV__c ,Expiration_Date__c
                                                         FROM Payment_Details__c 
                                                         WHERE Primary__c = true];
        if(primaryPaymentDetails.size()>0){
            return primaryPaymentDetails[0];
        }else{
            return null;
        }
    }
}