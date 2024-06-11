public class ChildrenUtility {

    public static Children__c GetChildbyID(string childId){
        
      Children__c Child = [SELECT Id ,Order__c FROM Children__c WHERE Id =: childId];
        
        return Child;
        
    }
}