trigger acTrigger on Account (before insert) {
/*TASK:when updating account that has 3 contacts,if account does not have a phone value,Iwant system to automatically retrieve the phone number
from the primary contact.If the primary contact does not have a phone number,I want the system to try to retrieve it from secondary contact.
If the secondary contact doed not have it either,I want the system to attempt to retrieve it from tertiary contact.if none of contacts have a
phone number,I want system to create a case and assign it to the account owner.the case should have subject'phone number is missing',
status of 'new',priority set to 'high' and origin marked as 'manual',Additional,I want this case to be tied to both the account and primary 
contact.   */

     for(Account ac : Trigger.new){
        
        if(String.isBlank(ac.Phone)){
            Map<String, String> myMap = new   Map<String, String>();
            
            List<Contact> conList = [SELECT Id, Phone, Level__c, AccountId FROM Contact WHERE AccountId =: ac.id AND  Level__c != null];
            
            
            Contact primaryContact;
            
            for(Contact con: conList){
                myMap.put(con.level__C, con.Phone);
                if(con.Level__c =='Primary'){
                    primaryContact =con;
                }
            }
            
            if(String.isNotBlank(myMap.get('Primary'))){
                ac.Phone = myMap.get('Primary');
            }
            else if(String.isNotBlank(myMap.get('Secondary'))){
                ac.Phone = myMap.get('Secondary');
            }
            else if(String.isNotBlank(myMap.get('Tertiary'))){
                ac.Phone = myMap.get('Tertiary');
            }
            else {
                Case cs = new Case();
                cs.Status ='New';
                cs.Subject ='Phone is missing for the Account';
                cs.Origin='Manual';
                cs.AccountId=ac.id;
                cs.OwnerId =ac.OwnerId;
                cs.ContactId = primaryContact.Id;
                
                insert cs;
            }
            
        }
        
    }
}