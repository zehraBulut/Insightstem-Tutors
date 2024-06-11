public class SandboxUtility {
  
   @invocableMethod (Label ='Clean Org')//flowda goreblrsn bu methodu
    public static void CeanOrg1(){     
        delete [SELECT Id FROM Children__c];  
        delete [SELECT Id FROM Parent__c]; 
        delete [SELECT Id FROM Service__c]; 
        delete [SELECT Id FROM Payment__c]; 
        delete [SELECT Id FROM Income__c]; 
        delete [SELECT Id FROM Expense__c]; 
    }
     public static void CeanOrg2(){  //With LIMIT  
        delete [SELECT Id FROM Children__c LIMIT 250];  
        delete [SELECT Id FROM Parent__c  LIMIT 250]; 
        delete [SELECT Id FROM Service__c LIMIT 250]; 
        delete [SELECT Id FROM Payment__c LIMIT 250]; 
        delete [SELECT Id FROM Income__c  LIMIT 250]; 
        delete [SELECT Id FROM Expense__c LIMIT 250];
    }
    public static void CleanOrg3(){  //Listeye donusturup size kontrol ettık
       List<Children__c> cL=  [SELECT Id FROM Children__c];  
       List<Parent__c> pL  =  [SELECT Id FROM Parent__c];  
       List<Service__c> sL =  [SELECT Id FROM Service__c];  
       List<Payment__c> payL= [SELECT Id FROM Payment__c];  
       List<Income__c> IL  =  [SELECT Id FROM Income__c];  
       List<Expense__c> eL =  [SELECT Id FROM Expense__c];  
       
         if(cL.size()>0){
            delete cL;
        }
         if(pL.size()>0){
            delete pL;
        }
         if(sL.size()>0){
            delete sL;
        }
         if(payL.size()>0){
            delete payL;
        }
         if(IL.size()>0){
            delete IL;
        }
         if(eL.size()>0){
            delete eL;
        }        
    }   
    
     public static void CleanOrg4(){ //Tum Listelerı tek1 DML ile sılmek ıcın //list ıcın max 10.000 record sıleblrsn
       List<sObject> cL   = [SELECT Id FROM Children__c];  
       List<sObject> pL  =  [SELECT Id FROM Parent__c];  
       List<sObject> sL =   [SELECT Id FROM Service__c];  
       List<sObject> payL=  [SELECT Id FROM Payment__c];  
       List<sObject> IL  =  [SELECT Id FROM Income__c];  
       List<sObject> eL =   [SELECT Id FROM Expense__c];  
         
       List<sObject> allRecords = new  List<sObject>();
                      allRecords.addAll(cL);
                       allRecords.addAll(pL);
                        allRecords.addAll(sL);
                         allRecords.addAll(payL);
                          allRecords.addAll(IL);
                           allRecords.addAll(eL);
              if(allRecords.size()>0){
                  delete allRecords;
         }             
      }
    
    public static void   CleadOrg5(){  // with Filter
       List<sObject> cL   = [SELECT Id FROM Children__c WHERE createdDate<LAST_n_DAYS:3];  
       List<sObject> pL  =  [SELECT Id FROM Parent__c   WHERE createdDate<LAST_n_DAYS:3];  
       List<sObject> sL =   [SELECT Id FROM Service__c  WHERE createdDate<LAST_n_DAYS:3];  
       List<sObject> payL=  [SELECT Id FROM Payment__c  WHERE createdDate<LAST_n_DAYS:3];  
       List<sObject> IL  =  [SELECT Id FROM Income__c   WHERE createdDate<LAST_n_DAYS:3];  
       List<sObject> eL =   [SELECT Id FROM Expense__c  WHERE createdDate<LAST_n_DAYS:3];  
         
       List<sObject> allRecords = new  List<sObject>();
                      allRecords.addAll(cL);
                       allRecords.addAll(pL);
                        allRecords.addAll(sL);
                         allRecords.addAll(payL);
                          allRecords.addAll(IL);
                           allRecords.addAll(eL);
              if(allRecords.size()>0){
                  delete allRecords;
      }                 
    }   
}