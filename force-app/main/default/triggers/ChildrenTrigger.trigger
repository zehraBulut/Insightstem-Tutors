trigger ChildrenTrigger on Children__c (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
       
     if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){        
       CustomValidationRules.ChildValidationRule(Trigger.new);       
     }  
    
    if(Trigger.isInsert && Trigger.isAfter){
        ChildrenTriggerHandler.UpdateNumberofChildrenInsert(Trigger.new);  //child insert olunca numberofchıldren olusması ıcn calısır
    }
    
    if(Trigger.isUpdate && Trigger.isAfter){
        ChildrenTriggerHandler.UpdateNumberofChildrenUpdate(Trigger.old,Trigger.new); //chıldren sayısı degstgınde numberofchıldren degscek
    }
    
    if(Trigger.isDelete && Trigger.isAfter){
       ChildrenTriggerHandler.UpdateNumberofChildrenInsert(Trigger.old); //sılındıgınde
    }
    
      if(Trigger.isUnDelete && Trigger.isAfter){
       ChildrenTriggerHandler.UpdateNumberofChildrenInsert(Trigger.old);  //sılınen chıldları gerı getrdık
    }
}