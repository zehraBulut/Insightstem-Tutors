//!!!!!Triggerin yardımcı clası : controller yada handler claslardr ,create all codes here,call them from other clasess
 
 public class ParentTriggerHandler {   
     
    public static void updateParent(List<Parent__c> parentList){  
        
        List<String> errorLogs  = new List<String>();
        List<String> succesLogs = new List<String>();
       
        try{
            
             for(Parent__c  newParent : parentList){  
       
        if(newParent.Guardian_Relationship__c == 'Father'){
            newParent.Guardian_BirthDate__c =newParent.Father_Birthdate__c;
            newParent.Guardian_Email__c = newParent.Father_Email__c;
            newParent.Guardian_Phone__c=newParent.Father_Phone__c;
            newParent.Guardian_Phone__c=newParent.Father_Mobile__c;
            newParent.Guardian_Name__c=newParent.Father_Full_Name__c;
            
        }else if(newParent.Guardian_Relationship__c == 'Mother'){
            newParent.Guardian_BirthDate__c =newParent.Mother_Birthdate__c;
            newParent.Guardian_Email__c = newParent.Mother_Email__c;
            newParent.Guardian_Phone__c=newParent.Mother_Phone__c;
            newParent.Guardian_Phone__c=newParent.Mother_Mobile__c;
            newParent.Guardian_Name__c=newParent.Mother_Full_Name__c;
             }       
           }              
          succesLogs.add('New incomes created successfully.');
            
          APILogUtility.SuccessLog('PaymentTriggerHandler',succesLogs); //oncesi :APILOgUtility.SuccessLog('ParentTriggerHandler','Parents is updated successfully');
        }
          catch(Exception e){
            
            errorLogs.add('New incomes could not be created.Error is occured. ');
            errorLogs.add(e.getMessage());
            
            APILogUtility.ErrorLog('PaymentTriggerHandler',errorLogs);                     
        }      
     }
     
   
     
     
  }