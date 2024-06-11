/* Trigger Handler Configpublic :metaData || fields:NotifyAdmin,After Insert....,  */

//**************************************************************************************************************************************
 
 public class ServiceTriggerHandler {

    public static void CreatePayments(List<Service__c> ServiceList){ 
        
        List<string> successLogs = new List<string>(); //try ın dsında olmalı bu classlar!!!!! || asagıda kulanıcaz varıableı 
        List<string> errorLogs = new List<string>();
                      
        try{
            
     //servıceTrıger clastakı codeları TRY bloguna koydum ...eger hata olursa catch blogunda APILOGlar yakalıcak!!!!
                     
     List<Payment__c> paymentList = new List<Payment__c>();  
            
       for(Service__c newService : ServiceList){
           
        if(newService.Plan__c == 'Monthly'){ 
            
        //custom meta d olustrduk:'Payment Installments Setting' ||'PaymentInstallmentsSettingsUtility' clasında methodlar olstu,burdanda cagryorz  
           Integer NumberofInstallments  = PaymentInstallmentsSettingsUtility.NumberofInstallments('Monthly');
           string PaymentStartingMonth  = PaymentInstallmentsSettingsUtility.GetPaymentStartMonth('Monthly');   
           Decimal Discount = PaymentInstallmentsSettingsUtility.GetDiscount('Monthly');  
            
           //PaymentStartingMonth 'un 9 olarak yazmak ıcın DateUtility olstrdm(switch on kulandm)
           Integer startMonth = DateUtility.GetMonthinNumber(PaymentStartingMonth);           
           successLogs.add('start Month is found' + startMonth);
                 
            Integer endMonth   = startMonth + NumberofInstallments;
            successLogs.add('End Month is found' + endMonth);
            
           for(Integer i=startMonth; i<endMonth; i++){  
               
            Payment__c newPayment = new Payment__c ();
               newPayment.Parent__c = newService.Parent__c;
               newPayment.Child__c =newService.Child__c;
               newPayment.Service__c =newService.Id;
               newPayment.Plan__c = 'Monthly';
               newPayment.Payment_Date__c =Date.newInstance(2024,i,1);
               newPayment.Month_Paid__c =Datetime.newInstance(2024,i,1).format('MMMM');   //('EEEE'):Gunlerı, ('YYYY') = yılları gosterır
               newPayment.Total_Amount__c = PaymentUtility.CalculateTotalAmount(newPayment, newService)/NumberofInstallments;
                      
                   paymentList.add(newPayment);              
             }
            
          } else if(newService.Plan__c == 'Yearly'){    
              
           Decimal Discount = PaymentInstallmentsSettingsUtility.GetDiscount('Yearly');  
           string PaymentStartingMonth  =PaymentInstallmentsSettingsUtility.GetPaymentStartMonth('Yearly');  
              
           
              
            Payment__c newPayment = new Payment__c ();
               newPayment.Parent__c = newService.Parent__c;
               newPayment.Child__c =newService.Child__c;
               newPayment.Service__c =newService.Id;
               newPayment.Plan__c ='Yearly';
               newPayment.Month_Paid__c = PaymentStartingMonth;
               newPayment.Total_Amount__c = PaymentUtility.CalculateTotalAmount(newPayment, newService);
                    paymentList.add(newPayment);
              
          }          
        }
           insert paymentList;
            
            
            successLogs.add('Payments created successfully'); 
            
        APILOgUtility.SuccessLog('ServiceTriggerHandler', successLogs); //(string APIName, string LogMessage){   
                      
        }
           catch(Exception e){
            
           /*  bunu kaldrdık APILOGUtility classa  tasıdık   
             API_Log__c log = new API_Log__c();
            log.API_Name__c = 'Error at ServiceTriggerHandler' ;  //ClassName : 'ServiceTriggerHandler' yaz
            log.Is_Error__c = true;
            log.Log_Message__c = e.getMessage();
                  insert log;  */
               
            //errorLogları enyukarıda lıst halınde olstrduk
            errorLogs.add(e.getMessage());
            errorLogs.add(string.valueOf(e.getLineNumber()));
            errorLogs.add(string.valueOf(e.getCause()));
            errorLogs.add(e.getStackTraceString());
            
       APILOgUtility.ErrorLog('ServiceTriggerHandler', errorLogs); //(string APIName, string LogMessage){ 
                  
     
        }             
    }

}