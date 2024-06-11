public class PerentDueDatePaymentNotification implements Schedulable {
    
    public void execute(SchedulableContext SC){
        
       List<Payment__c> DuePayments = [SELECT Id,Due_Date__c,Paid_Amount__c ,Parent__c FROM Payment__c WHERE Due_Date__c = next_n_Days:3 AND Payment_Status__c != 'Paid'];  //bıtıs tarıhı 3 gun once
      
        for(Payment__c payment : DuePayments){
            
        //1.way
         Parent__c relatedParent = [SELECT Id,Guardian_Email__c, Guardian_Name__c FROM Parent__c WHERE Id =: payment.Parent__c];
       
        //2.way
        string emailBody = '<div><p>Dear' + relatedParent.Guardian_Name__c + ',</p><p>We hope this email finds you well. This is a friendly reminder regarding an upcoming payment for [Specify Reason/Service].</p><p><strong>Payment Details:</strong></p><ul><li><strong>Amount:</strong> ' + payment.Paid_Amount__c + '</li><li><strong>Due Date:</strong>' + payment.Due_Date__c +'</li></ul><p>Please ensure that the payment is made by the specified due date to avoid any inconvenience. If you have already made the payment, kindly disregard this message.</p><p>Thank you for your prompt attention to this matter. If you have any questions or concerns, feel free to contact us at [Insert Contact Information].</p><p>Best regards,</p><p>[Your Organization Name]</p></div>' ;
        EmailUtility.sendMail(relatedParent.Guardian_Email__c ,'You have upcoming payment', emailBody);        
     }
   }
}