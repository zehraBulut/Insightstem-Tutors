public class ParentUtility {
    
    public static Parent__c getParentbyId(string parentId){
        
         Parent__c relatedParent = [SELECT Id,Guardian_Email__c, Guardian_Name__c
                                    FROM Parent__c 
                                    WHERE Id =: parentId];
        
          return relatedParent;
    }
}