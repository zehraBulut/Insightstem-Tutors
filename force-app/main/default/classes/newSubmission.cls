/*   webtocase teki formdan json aldık case obj e/onu apexe cevrdk NewSubmissionResponse clasında/ve bu clasta mapp yaptık
      dev consoledan cagr: Case cs =[SELECT Id,Description FROM Case WHERE Id = '500WT000002969vYAA'];
                          newSubmission.newRegistration(cs);         
 not: ID = oluşan case ın ıd si..
//payload:json 
******************************************************************************************************************************* */

public class newSubmission {
  
    public static void newRegistration(Case cs){ //json case ten geldgı ıcın
        
       List<string> successLogs = new List<string>();//enson ekledım try catch ıcın
       List<string> errorLogs = new List<string>();
               
       try{
            
       NewSubmissionResponse result = NewSubmissionResponse.parse(cs.Description);               
            
        Parent__c newParent = new Parent__c();
        
        newParent.Guardian_Relationship__c = result.parent.guardian;
        newParent.Father_Full_Name__c = result.parent.fatherName;
        newParent.Father_Birthdate__c = Date.valueOf(result.parent.fatherBirthdate);
        newParent.Father_Phone__c = result.parent.fatherPhone;
        newParent.Father_Mobile__c = result.parent.fatherMobile;
        newParent.Father_Email__c = result.parent.fatherEmail;      
        newParent.Mother_Full_Name__c = result.parent.motherName;
        newParent.Mother_Birthdate__c = Date.valueOf(result.parent.motherBirthdate); 
        newParent.Mother_Phone__c = result.parent.motherPhone;
        newParent.Mother_Mobile__c = result.parent.motherMobile;
        newParent.Mother_Email__c = result.parent.motherEmail;
        insert newParent;
        

         List<Children__c> children = new List<Children__c>(); 
         List<Service__c> services = new List<Service__c>(); 
        
        Integer childIndex = 1;
        
        for(NewSubmissionResponse.Children child : result.parent.Children){
            
           Children__c newChild = new Children__c();
            newChild.Name = child.fullName;
            newChild.Gender__c = child.gender;
            newChild.Parent__c = newParent.Id;
         
            switch on childIndex{
                when 1 {
                    newChild.Order__c = 'First Child';
                }when 2 {
                     newChild.Order__c = 'Second Child';
                }when 3{
                    newChild.Order__c = 'Third Child';
                  }
                }
                  childIndex ++;
                    children.add(newChild);  
                     insert newChild;
            
                Service__c service = new Service__c();
                  service.Plan__c = child.plan;
                   service.Package__c = child.packagePlan;
                    service.Parent__c = newParent.Id;
                    service.Additional_Subjects__c = child.additionalSubject;
                     service.Child__c = newChild.Id;
                     services.add(service);                      
                   }                   
                      insert services;            
                 }
              
       catch(Exception e){
            errorLogs.add(e.getMessage());
            errorLogs.add(string.valueOf(e.getLineNumber()));
            errorLogs.add(string.valueOf(e.getCause()));
            errorLogs.add(e.getStackTraceString());
            
       APILOgUtility.ErrorLog('newSubmission', errorLogs);          
            
       }  
      }       
    }