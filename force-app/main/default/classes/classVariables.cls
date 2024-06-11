public class classVariables {    
  //class variables|method dısında olmalı | methodu ve class variable static yapmalısın
    public static Integer num1 = 5;  //Integer num1 = 5; yerine
    public static Integer num2 = 9;  //Integer num2 = 9; yerine
    public static  Account ac = [SELECT Id ,Name FROM Account WHERE Name ='Amazon'];
    
    public static void sum(){          
        Integer sum = num1 + num2;
        system.debug('sum of' + num1 + ' and' + num2 + ' is' + sum);      
    }    
     public static void times(){        
        Integer times = num1 * num2 ;
        system.debug('product of' + num1 + ' and' + num2 + ' is' + times);      
    }
    
    public static void createPrimaryContact(){
        
        Contact con = new Contact();
        con.LastName = 'Primary Contact';
        con.AccountId = ac.Id;
                        insert con;
    }
    public static void createSecondaryContact(){
        
        Contact con = new Contact();
        con.LastName = 'Secondary Contact';
        con.AccountId = ac.Id;
                        insert con;
    }
    public static void createTertiaryContact(){
        
      Account ac = [SELECT Id ,Name FROM Account WHERE Name ='University of Arizona'];       
        Contact con = new Contact();
        con.LastName = 'Tertiary Contact';
        con.AccountId = ac.Id;
                        insert con;
    }    
}