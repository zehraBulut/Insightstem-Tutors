trigger oppTrigger on Opportunity (after insert, after update, after delete, after undelete) {

 OpportunityTriggerHandler.UpdateAccounts(Trigger.new, 
                                             Trigger.OldMap, 
                                             Trigger.isInsert, 
                                             Trigger.isUpdate, 
                                             Trigger.isDelete, 
                                             Trigger.isUndelete);
    
  }