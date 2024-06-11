trigger ServiceTrigger on Service__c (after insert, before insert, before update, before delete, after update, after delete, after undelete) {  //Task: servis olusunca otomatık paymentta gelsın ıstyrm


    Trigger_Handler_Config__mdt TriggerConfig = TriggerHandlerConfigUtility.GetTriggerHandlerConfig('ServiceTrigger'); //custommetadatayı cagırır
    
       
    if(Trigger.isInsert && Trigger.isAfter && TriggerConfig.After_Insert__c == true){  //customMetadatakı  fıeld :After_Insert :checkbox 
        
       ServiceTriggerHandler.CreatePayments(Trigger.new);      //methodu cagırır//Trigger.new-->list
        
       //  EmailUtility.sendMail('ozgurdestina@gmail.com' ,'Notice' , 'The father Email has been updated');
        
        
        if(TriggerConfig.NotifyAdmin__c){   //TriggerConfig.NotifyAdmin__c == true || NotifyAdmin__c: metadata: checkbox
         
        //  EmailUtility.sendMail('ozgurdestina@gmail.com' ,'Notice' , 'The father Email has been updated');//eger metadatada uncheck ıse NotifyAdmin__c maıl gıtmez
        }         
    }           
    
    
    if((Trigger.isBefore && Trigger.isInsert ) || (Trigger.isBefore && Trigger.isUpdate )){
        
        
        // **********************VALIDATION RULES START here!!!************************** 
                 
          CustomValidationRules.ServiceValidationRules(Trigger.new);
         
         // ***********************VALIDATION RULES END here!!!**************************   
        
    }
    
    
    
    
    
  
}