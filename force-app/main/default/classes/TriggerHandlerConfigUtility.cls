public class TriggerHandlerConfigUtility {
    
  public static Trigger_Handler_Config__mdt  GetTriggerHandlerConfig(string Label){  //Trigger_Handler_Config__mdt : customMetaData
        
    List<Trigger_Handler_Config__mdt> SelectedConfigs = [SELECT Id,Label,Before_update__c,Before_Insert__c,Before_Delete__c,
                                                           After_Update__c,After_Insert__c,After_Delete__c,NotifyAdmin__c          
                                                          FROM Trigger_Handler_Config__mdt WHERE Label =: Label ];
                 
      if(SelectedConfigs.size()>0){
          return SelectedConfigs[0]; //veya SelectedConfigs.get(0)
      }else{
          return null;
      }
      
    }
}