/*PaymentMethodSettings :customMetaData
 *fields:  payment Method || Service Charges
 *payment Method : bank,card,cash,paypal
 *servise charges: servıs ucretı ||sen belırlersın  */
//****************************************************************************************************************************************************************
  
public class PaymentMethodSettingsUtility {
   
    public static Decimal GetServiceChargeByPaymentMethod(string PaymentMethod){
        
        List<Payment_Method_Setting__mdt> ServiceCharges = [SELECT Id,Payment_Method__c,Service_Charges__c FROM Payment_Method_Setting__mdt
                                                          WHERE Payment_Method__c =:PaymentMethod];
       //her zaman null check yapmalısın
        if(!ServiceCharges.isEmpty()){
            return ServiceCharges[0].Service_Charges__c;  //ılk recordun Service_Charges__c degerını almak ıstyrm
        }else{
            return 0.00;
        }
  }
}