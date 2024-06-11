@isTest
public class accountUtilityTEST {
    
    //@isTest yerine testmethod  da yazabılırsın  //test yaparken sıstemdekı ID ler kulanılmazz
    static testmethod void TestD(){
        
        Account ac = new Account();
        ac.Name= 'Bank of TURKEY';   //not:eger required F recordType ıse systeme eklerken/objectM/recordType/ıd sını alablrsn
        
                      insert ac;  
        
        accountUtility.getAccountById(ac.Id);
        accountUtility.getAccountByName(ac.Name);
        accountUtility.getAllAccounts();
        accountUtility.getActiveAccounts();
        accountUtility.getAccountWithAccounts();
        accountUtility.getAccountWithoutAccounts();
        accountUtility.updateRatingOfAccount('Hot');
        
                                 
    }

    
    
    
}