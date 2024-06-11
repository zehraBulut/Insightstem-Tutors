// Test classta parameter kulanılmaz
 
 @isTest
 public class TestUtilityTEST {
    
    @isTest
    public static void testA(){         
        TestUtility.TestRecords('Monthly');
    }
    
     @isTest
    public static void testB(){         
        TestUtility.NTestRecords(3);
    }

    @isTest
    public static void testC(){        
        TestUtility.NewParent('asi','Father');
    }
    
    @isTest
    public static void testD(){ 
        TestUtility.GenerateRandomParent();
    }  
     
     @isTest
    public static void testE(){ 
        
        Parent__c   newParent   = TestUtility.NewParent();
        Children__c newChild    = TestUtility.newChild(newParent.Id);
        Service__c  newService  = TestUtility.newService(newParent.Id, newChild.Id,'Monthly'); 
        
        newService.Plan__c ='Yearly';
        update newService;
        
        TestUtility.NewPayment(newParent.Id, newChild.Id, newService.Id);      
    }
    
     @isTest
    public static void testK(){ 
        
        Test.StartTest();
        TestUtility.NewParent('zero','Father');
        Test.StopTest();
        
        Parent__c zeroParent = [SELECT Id,Father_Full_Name__c FROM Parent__c LIMIT 1];
        
        System.assertEquals('zero' , zeroParent.Father_Full_Name__c); 
    
   }
}