public class DeleteObjectsClass {

//parameterli method(degısken varsa : kulan  deger kulancaksan degerı yaz  drek)
  public static void deleteServices(Integer numRecord ,Boolean isAutoPay){ 
        
  List<Service__c> serviseL = [SELECT Id From Service__c WHERE Auto_Pay__c =: isAutoPay LIMIT :numRecord];
       
      if(serviseL.size() >0){
          delete  serviseL ;
          API_Log__c  newLog =  new API_Log__c();
          newLog.API_Name__c = 'Deleting services';
          newLog.Is_Error__c =  false;
          newLog.Log_Message__c = 'Services are deleted :) ';
                                 insert newLog ;          
      } else {
          
        API_Log__c  newLog = new API_Log__c();
          newLog.API_Name__c = 'Deleting services';
          newLog.Is_Error__c = true;
          newLog.Log_Message__c = 'No services Found  :( ';
                                insert newLog ;
      }       
    }    
     public static void createNewServices(){//parametersız method
         
        Service__c newS = new Service__c();
           newS.Auto_Pay__c = true;         
              insert newS;
   }  
    public static void createNServices(Integer numServices){
        List<Service__c> serviceList = new List<Service__c> ();
        
          for (Integer i=1; i<=numServices ; i++){
            
            Service__c newS = new Service__c();
              newS.Additional_Subjects__c= 'Japanese';
              newS.Amount__c =333;
              newS.Package__c = 'Single Subject';
              newS.Auto_Pay__c = false;
                  serviceList.add(newS);             
          } 
                   
        if(!serviceList.isEmpty()){
             insert serviceList;
            
        }else {
            
          API_Log__c  newLog =  new API_Log__c();
          newLog.API_Name__c = 'Creating  services';
          newLog.Is_Error__c =  true;
          newLog.Log_Message__c = 'No any Record Created.List empty ';
       
           insert newLog ;              
        }          
      }       
    }