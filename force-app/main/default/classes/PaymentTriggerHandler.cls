// satır 43 ıcın: payment olustgunda total amount uzerınden total paid eklenıcne remaining paid olusucak

/*********************************************************************************************************************/
public class PaymentTriggerHandler {

    public static void CreateNewIncome(List<Payment__c> paymentList){//trigger.new yerıne list yazdım
        
        List<String> errorLogs  = new List<String>();//catchin gormesı ıcın try ın dsında olstrlmak zorunda bu loglar
        List<String> succesLogs = new List<String>();
        
          try{
              
        List<Income__c> newIncomes = new  List<Income__c>();           
                
            //trigger.new e ulasmak ıcın  
            for(Payment__c payment : paymentList){  //bu code Triggerda olustruldgu ıcın Trigger.new i yeni şıstname ıle degstrmeyı unutma
                if(payment.Payment_Status__c == 'Paid'){
                    
                    Income__c newIncome = new Income__c();
                    newIncome.Amount__c = payment.Paid_Amount__c;
                    newIncome.Income_Date__c = payment.Payment_Date__c;
                    newIncome.Payment__c = payment.Id;     
                    
                    newIncomes.add(newIncome);                    
                 }
               } 
            insert newIncomes; 
              
              succesLogs.add(newIncomes.size() + ' new Incomes created');
              succesLogs.add('New Incomes created successfully');
              
            APILogUtility.SuccessLog('PaymentTriggerHandler',succesLogs);   
              
                   }   
        
         catch(Exception e){            
             errorLogs.add('New Incomes couldt be Created');   
            APILogUtility.ErrorLog('PaymentTriggerHandler',errorLogs);              
        } 
    }
    
    //paymenta baglı servısını bulduk /servısın odemelerını update ederek yansıtmak ıstyrm
    public static void UpdateTotalPaidAmount(List<Payment__c> paymentList){  
        
        List<Service__c> serviceList = new List<Service__c>(); 
           for(Payment__c payment : paymentList){      //yeni bır payment olusunca               
                   
               if(payment.Payment_Status__c == 'Paid'){
                   
                   Service__c relatedService = ServiceUtility.getServiceById(payment.Service__c); //paymentın servicenı bul
                   
                    relatedService.Total_Paid_Amount__c += payment.Total_Amount__c ; 
                     relatedService.Remaining_Amount__c =  relatedService.Total_Amount__c - relatedService.Total_Paid_Amount__c;
                      serviceList.add(relatedService);
               }
             }
                update  serviceList;                          
    }
    
    
 //***********Lesson56:yapılan her payment ıcın callout yapıyor***********************************
    public static void checkPaymentDetails(List<Payment__c> paymentL , Payment_Details__c paymentDetails){
        
        for(Payment__c payment: paymentL){            
       PaymentCard.MakePaymentCard(paymentDetails.Card_Number__c , paymentDetails.CVV__c , paymentDetails.Expiration_Date__c , payment.Id);           
   }     
  }
 //************Lesson56*************************************************************************
    
    
    
    
}