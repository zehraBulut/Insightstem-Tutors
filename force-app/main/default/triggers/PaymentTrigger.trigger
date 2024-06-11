trigger PaymentTrigger on Payment__c (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
    
        if(Trigger.isUpdate && trigger.isBefore){ 
            
          CustomValidationRules.PaymentValidationRules(Trigger.new);                      
          PaymentUtility.FinalPayment(Trigger.new); //paymentla ılgılı method            
    }  
    
 //********her paymentta statusu : paid yaptgmzda yenı Income olsması lazım*************************************************** 
 
      if(Trigger.isUpdate && trigger.isAfter){ 
               
      PaymentTriggerHandler.CreateNewIncome(Trigger.new);   //task 39 : her paymentta statusu :paid yaptgmzda yenı Income olsması lazım  //note:Trigger.newMap.values() == Trigger.new()                  
        for(Payment__c payment : Trigger.new){ 
         Parent__c relatedParent = ParentUtility.getParentbyId(payment.Parent__c); 
            
         if(payment.Payment_Status__c == 'Paid'){   
                    
         StaticResource sr = [SELECT Id, body FROM StaticResource WHERE Name = 'DueDateNoiticiationEmailbody' LIMIT 1]; 
             
     /* Boyle uzun maıller kulanılcagı zaman static resource kullan --> sonra asagdakı gbı degstr farklı olanları
      <div><p>Dear $parentName$ </p><p>We hope this email finds you well. This is a friendly reminder regarding an upcoming payment for 
      [Specify Reason/Service].</p><p><strong>Payment Details:</strong></p><ul><li><strong>Amount:</strong> $payment.Amount$ </li><li><strong>
      Due Date:</strong> $Due Date$</li></ul><p>Please ensure that the payment is made by the specified due date to avoid any inconvenience. 
      If you have already made the payment, kindly disregard this message.</p><p>Thank you for your prompt attention to this matter. 
      If you have any questions or concerns, feel free to contact us at [Insert Contact Information].</p><p>Best regards,</p><p>[Your Organization Name]</p></div>';*/
         
         string emailBody = sr.Body.toString();
             
         string emailBody1 = emailBody.replace('$parentName$',relatedParent.Guardian_Name__c);
         string emailBody2 = emailBody1.replace('$payment.Amount$',string.valueOf(payment.Paid_Amount__c));  
         string emailBody3 = emailBody2.replace('$DueDate$',string.valueOf(payment.Due_Date__c));   
             
      //   EmailUtility.sendMail(relatedParent.Guardian_Email__c ,'You did a payment recently', emailBody3);                
     
     } else if(payment.Payment_Status__c == 'Initiate Payment' && payment.Payment_Method__c == 'Credit Card'){
         
             
    //******task56-make payment******************* 
     Payment_Details__c primaryPaymentDetails = PaymentDetailsUtility.getPrimaryPaymentDetailByParentId(relatedParent.Id);
    PaymentTriggerHandler.checkPaymentDetails(Trigger.new, primaryPaymentDetails);              
   //******task56-make payment********************** 
   
     } else if (payment.Payment_Status__c == 'Calculate Payment'){
        PaymentTriggerHandler.UpdateTotalPaidAmount(Trigger.new); //payment yapıldgında update edılcek toplam odemeye ekleme yapılarak
     }        
   }                                                    
          
     

          
                                                                                                                                                                                       
  }   
}