global class APILogDeleteBatchable implements Database.Batchable<sObject>{ //İmplement: franchaizer(start-execute-finish methodlarını kulanmak zorundasın baska clasta)
    
     global Database.QueryLocator start(Database.BatchableContext BC){ //Querry yap
        
        String query='SELECT Id from API_Log__c';
        return Database.getQueryLocator( query);
    } 
    
     global void execute(Database.BatchableContext BC, List<API_Log__c> logList){  //Liste olustur parameterda|| ıslemler executete yapılır
       
        //CODE write
       delete  logList;
    }
    
      global void finish (Database.BatchableContext BC){ // test olusturmak yada sonuca baglı bsı yapmak ıstersen|| maıl gondermek gbı..  
        
  }
    
 /*Anonymoustan çağırırken Instance olustrablrsnz                veya        Database.executeBatch(new APILogDeleteBatchable(),3);    
APILogDeleteBatchable objA = new APILogDeleteBatchable();
Database.executeBatch(objA,5);   */

    
}