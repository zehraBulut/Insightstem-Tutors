public class APILOgUtility {
    
   /*types of APILogs
     e.getMessage();
     e.getLineNumber();
     e.getCause();
     e.getStackTraceString();*/
    
    public static void ErrorLog(string APIName, List<string> LogMessage){
        
       API_Log__c log = new API_Log__c();
            log.API_Name__c = APIName;  // oncekı hali log.API_Name__c='Error at ServiceTriggerHandler
            log.Is_Error__c = true;
            log.Log_Message__c = string.join(LogMessage,  ';');    //log.Log_Message__c= e.getMessage();
                  insert log; 
    }
      public static void SuccessLog(string APIName, List<string> LogMessage){   
          
           API_Log__c log = new API_Log__c();
            log.API_Name__c = APIName;  // oncekı hali log.API_Name__c='Error at ServiceTriggerHandler
            log.Is_Error__c = false;
            log.Log_Message__c =string.join(LogMessage, ';');    //log.Log_Message__c= e.getMessage();
                  insert log; 
 }
}