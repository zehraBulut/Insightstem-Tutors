public class AccountUtil { 
    public static Account createAccount(){
    
        Account ac = new Account();
        ac.Rating = 'Hot';
        ac.Active__c = 'Yes';
        ac.Name = 'Bank of Turkey';
        
        insert ac;
        return ac;
    }
}