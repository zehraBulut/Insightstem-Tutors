// TUM METADATADAKI VALIDATION İCİN OLUSTURULAN FIELDLERI GETIRITYORUZ BU CLASSTAN

//********************************************************************************************************************************************* 
public class ValidationRuleConfigUtility {
    
   public static ValidationRuleConfig__mdt GetVRConfig(){
        
     List<ValidationRuleConfig__mdt> VRConfigs =[SELECT Id, ALL__c,Order__c,Plan__c,Package__c,Parent__c,Child__c, Gurdian_Relationship__c,Payment_Status__c 
                                                 FROM ValidationRuleConfig__mdt];
        
        if(VRConfigs.size()>0){
            return VRConfigs[0];
        }else{
            return null;
        }
    }
}