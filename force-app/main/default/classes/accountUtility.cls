public class accountUtility {
   
    public static Account getAccountById(string  AccountId){
        Account ac = [SELECT Id,Rating,Name,Phone,Fax,Active__c,AnnualRevenue FROM Account WHERE Id =: AccountId];
        
        if(ac != null){
           return ac; 
        }else{
            return null;
        }
    }
    
      public static Account getAccountByName(string  AccountName){
        Account ac = [SELECT Id,Rating,Name,Phone,Fax,Active__c,AnnualRevenue FROM Account WHERE Name =: AccountName];
        
        if(ac != null){
           return ac; 
        }else{
            return null;
        }
    }
    
      public static List<Account> getAllAccounts(){
        List<Account> acList = [SELECT Id,Rating,Name,Phone,Fax,Active__c,AnnualRevenue FROM Account ];
        
        if(acList.size() != 0){
           return acList; 
        }else{
            return null;
        }
    }
    //listte size()
      public static List<Account> getActiveAccounts(){
       List<Account> acList = [SELECT Id, Rating, Name, Phone, Fax ,Active__c, AnnualRevenue FROM Account WHERE  Active__c= 'Yes'];
        
        if(acList.size() != 0){
           return acList; 
        }else{
            return null;
        }
    }
    
    Public static List<Account> getAccountWithAccounts (){
         List<Account> acList = [SELECT Id,Rating,Name,Phone,Fax,Active__c,AnnualRevenue
                                 FROM Account 
                                 WHERE Id IN (SELECT AccountId FROM Contact)];
         if(acList.size() != 0){
           return acList; 
        }else{
            return null;
        }
    }
       
        Public static List<Account> getAccountWithoutAccounts (){
         List<Account> acList = [SELECT Id,Rating,Name,Phone,Fax,Active__c,AnnualRevenue
                                 FROM Account 
                                 WHERE Id NOT IN (SELECT AccountId FROM Contact)];
         if(acList.size() != 0){
           return acList; 
        }else{
            return null;
        }
    }
        
    public static void updateRatingOfAccount(string Rating){  //Rating ='Hot' dyeblrdın ama dynamic yapmak ıstedık//ratıngı='..' olmayanları getr demek
        List<Account> acList = [SELECT Id,Rating FROM Account WHERE Rating !=: Rating];
         for(Account ac: acList){    
            ac.Rating = Rating;     
        }
        update acList;
    }
    
}