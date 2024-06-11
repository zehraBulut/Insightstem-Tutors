trigger ParentTrigger on Parent__c (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
   
  if(Trigger.isInsert && Trigger.isBefore){         
  } 
  //Task:parentin FATHER Email adres degstgınde ownera Send mail(emaıl :emaıl utılıty clasındakı method kullanılcak)
    if(Trigger.isUpdate && Trigger.isBefore){
        
        for(Parent__c oldParent : Trigger.old){
            for(Parent__c newParent :Trigger.new){
                
                if(oldParent.Id == newParent.Id){  //AYNI KISILER 
                    if(oldParent.Father_Email__c != newParent.Father_Email__c){
                  //      EmailUtility.sendMail('ozgurdestina@gmail.com' ,'Notice' , 'The father Email has been updated');
                   }                                    
                }  
            }
        }    
    }
    
 // Birlestreblrsın busekıldede||ParentTriggerHandler clasından cagırdık codeları|Task:parenta record eklemeden once ve update etmeden once calıs
 // cagır ParentTriggerHandler ve methodunu
   if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){
       
         ParentTriggerHandler.updateParent(Trigger.new);
       
          CustomValidationRules.ParentValidationRule(Trigger.new); 
     }  
   }