public class thisKeyword {

      public static  Account ac = [SELECT Id ,Name FROM Account WHERE Name ='Express Logistics and Transport']; //CLASS VAriable

      public  static void createTertiaryContact(){ 
          
          if(ac.Active__c == 'Yes'){
              return;  //devam etmez durur eger Yes ıse
          }else{
              
        Account ac = [SELECT Id ,Name FROM Account WHERE Name ='mercedes'];       
        Contact con = new Contact();
        con.LastName = 'Tertiary Contact';
        con.AccountId = ac.Id;
                        insert con;  
       }
    } 
}