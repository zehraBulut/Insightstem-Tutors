/*customMetaData :Payment Installments Settingsda olusturulan fıeldlerı calıstırır 
||NumberofInstallments: taksit sayısı  
|| payment: odeme  */

//--------------------------------------------------!!!-------------------------------------------------------------------------------------------------

public class PaymentInstallmentsSettingsUtility {  
  
   public static Integer NumberofInstallments(string Plan){
        
      PaymentInstallmentsSettings__mdt  PIS =[SELECT Id ,Discount__c, Number_of_Installments__c, Payments_Starts_on__c, Plan__c 
                                              FROM PaymentInstallmentsSettings__mdt
                                              WHERE Plan__c =: Plan 
                                              LIMIT 1];
        return Integer.valueOf(PIS.Number_of_Installments__c); //Decimali integera cevırdık 
    }
    
    
    public static Decimal GetDiscount(string Plan){
        
      PaymentInstallmentsSettings__mdt  PIS =[SELECT Id ,Discount__c, Number_of_Installments__c, Payments_Starts_on__c, Plan__c 
                                              FROM PaymentInstallmentsSettings__mdt
                                              WHERE Plan__c =: Plan 
                                              LIMIT 1];
        return PIS.Discount__c; 
    }
    
    
    public static string GetPaymentStartMonth(string Plan){
        
      PaymentInstallmentsSettings__mdt  PIS =[SELECT Id ,Discount__c, Number_of_Installments__c, Payments_Starts_on__c, Plan__c 
                                              FROM PaymentInstallmentsSettings__mdt
                                              WHERE Plan__c =: Plan 
                                              LIMIT 1];
        return PIS.Payments_Starts_on__c; 
    }

}