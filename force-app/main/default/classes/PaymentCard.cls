/*lesson 52-->k.k. odemesı ıcın bır sıteyle ıntegratıon yapılcak,
post methodu kulanıldı
***************************************************************************************************************************/
public class PaymentCard {
           
  @future(Callout=true) //trıggerlarda callout yapmak ıcın future method kulanrz //future da return olmz   
    public static void MakePaymentCard(string CardNumber,string CVV,Date ExpirationDate,Id paymentId){  //call out yapıyor-payment blg gonderyr(odeme yapıyr) 
        
       List<string> successLogs = new List<string>();
       List<string> errorLogs = new List<string>();
        
     //post ıcın body ı olusturuyoruz  || not:dateutilityde method olstrdk burda kullandk  
        PaymentCardRequest PCR = new PaymentCardRequest();
        PCR.CardNumber = CardNumber;     
        PCR.CVV = CVV;                     
        PCR.ExpirationDate = DateUtility.DatetoString(ExpirationDate);
        
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://pathtosalesforce.com/IST/authorizecard.php?token=e42eace04f9b43c7bbdf0c990728343d');
        request.setMethod('POST');
        request.setBody(JSON.serialize(PCR)); //post methodunda kulanılır
        request.setHeader('Content-Type', 'application/json;charset=UTF-8'); //kopyala
        
        HTTPResponse response = http.send(request);
       
        system.debug(response.getStatusCode());
        system.debug(response.getBody());     
        
     //*************lesson 56 ******************************************************
         Payment__c payment = PaymentUtility.getPaymentByID(paymentId);  
        
        if(response.getStatusCode() ==200 || response.getStatusCode() ==201){            
             payment.Payment_Status__c = 'Paid';    
                   
             Task tsk = new Task();
            tsk.Subject = 'Payment Successfull';
            tsk.Priority = 'High';
            tsk.Status ='Not Started';
            tsk.OwnerId = payment.Parent__r.OwnerId;
            tsk.WhatId = payment.Parent__c;
            insert tsk;
            
        }else{
            
            payment.Payment_Status__c = 'Pending';
            
            Task tsk = new Task();
            tsk.Subject = 'Payment Failed';
            tsk.Priority = 'High';
            tsk.Status ='Not Started';
            tsk.OwnerId = payment.Parent__r.OwnerId; //parent custom oldg ıcın whatId
            tsk.WhatId = payment.Parent__c;
            insert tsk;            
        }
           update payment;
        
     if(response.getStatusCode() == 200 || response.getStatusCode() == 201){            
        successLogs.add(response.getBody());           
        APILOgUtility.SuccessLog('PaymentCard', successLogs); 
        
        }else{
            
            errorLogs.add(response.getBody());
            errorLogs.add(string.valueOf(response.getStatusCode()));
            
       APILOgUtility.ErrorLog('PaymentCard', errorLogs); 
     }         
   }   
                       
  
    //*****************lesson56***********************************************************
        
  @future(Callout = true) 
    public static void AddPaymentCard(string externalID,string CardNumber,string CVV,Date ExpirationDate){
              
     List<string> successLogs = new List<string>(); 
     List<string> errorLogs = new List<string>(); 
        
     //post ıcın body ı olusturuyoruz  || not:dateutilityde method olstrdk burda kullandk  
        PaymentCardRequest PCR = new PaymentCardRequest();
        PCR.CardNumber = CardNumber;      //PCR.CardNumber = '123456789432456';
        PCR.CVV = CVV;                      //PCR.CVV = '579';
        PCR.ExpirationDate = DateUtility.DatetoString(ExpirationDate); //PCR.ExpirationDate = '11/2028';          
        PCR.ExternalID = externalID;
        
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://pathtosalesforce.com/IST/creditcard.php?token=e42eace04f9b43c7bbdf0c990728343d');
        request.setMethod('POST');
        request.setBody(JSON.serialize(PCR)); //post methodunda kulanılır
        request.setHeader('Content-Type', 'application/json;charset=UTF-8'); //kopyala
        
        HTTPResponse response = http.send(request);
       
        system.debug(response.getStatusCode());
        system.debug(response.getBody());    
        
        if(response.getStatusCode() == 200 || response.getStatusCode() == 201){            
        
        successLogs.add(response.getBody());           
        APILOgUtility.SuccessLog('PaymentCard', successLogs); 
        
        }else{
            
            errorLogs.add(response.getBody());
            errorLogs.add(string.valueOf(response.getStatusCode()));
            
       APILOgUtility.ErrorLog('PaymentCard', errorLogs); 
     }    
    }
    
        
        
      @future(Callout = true) //UPDATE edıcez k kartını bu methodta
    public static void UpdatePaymentCard(string externalID,string CardNumber,string CVV,Date ExpirationDate){
        
     List<string> successLogs = new List<string>(); 
     List<string> errorLogs = new List<string>();        
        
     //post ıcın body ı olusturuyoruz  || not:dateutilityde method olstrdk burda kullandk  
        PaymentCardRequest PCR = new PaymentCardRequest();
        PCR.CardNumber = CardNumber;     
        PCR.CVV = CVV;                     
        PCR.ExpirationDate = DateUtility.DatetoString(ExpirationDate); 
        PCR.ExternalID = externalID;     
        
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://pathtosalesforce.com/IST/creditcard.php?token=e42eace04f9b43c7bbdf0c990728343d');
        request.setMethod('PUT');
        request.setBody(JSON.serialize(PCR)); //post methodunda kulanılır
        request.setHeader('Content-Type', 'application/json;charset=UTF-8'); 
        
        HTTPResponse response = http.send(request);
       
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        
      if(response.getStatusCode() == 200 || response.getStatusCode() == 201){            
        successLogs.add(response.getBody());            
        APILOgUtility.SuccessLog('PaymentCard', successLogs); 
        
        }else{
            
            errorLogs.add(response.getBody());
            errorLogs.add(string.valueOf(response.getStatusCode()));
            
       APILOgUtility.ErrorLog('PaymentCard', errorLogs); 
        
        }        
    }
    
    
    
     @future(Callout = true) 
    public static void DeletePaymentCard(string externalID){
        
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://pathtosalesforce.com/IST/creditcard.php?token=e42eace04f9b43c7bbdf0c990728343d&CardNumber=' + externalID);
        request.setMethod('DELETE');
        
        HTTPResponse response = http.send(request);
       
        system.debug(response.getStatusCode());
        system.debug(response.getBody());    
                
        
    }
    
}