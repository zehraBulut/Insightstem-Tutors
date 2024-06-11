@isTest
public class ParentTriggerHandlerTEST {
    
 @isTest
    public static void TestB(){
        
        Parent__c newParent = new Parent__C();
        newParent.Father_Full_Name__c='ali';
        newParent.Guardian_Relationship__c='Father';
     insert newParent;
        
         Parent__c newParent2 = new Parent__C();
         newParent2.Mother_Full_Name__c='aise';
         newParent2.Guardian_Relationship__c='Mother';
     insert newParent2;

    }
}