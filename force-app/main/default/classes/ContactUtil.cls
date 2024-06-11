public class ContactUtil {       
      public static Contact CreateContact(){
        
          Account ac = AccountUtil.createAccount();//accountUtil clasının methodunu cagrdk(method dısındada yazablrm public statıc yazarak)
          
          Contact con = new Contact();
            con.LastName = 'Smith';
            con.AccountId = ac.Id;
          
            insert con;
            return con;
        }
 
    }