public class stringUtility {

    public static string ModifyPhoneNumber(string phoneNumber){
        
    //Task:olmasnı ıstedgmz format: (545) 112 34 56
        
        string modifiedPhoneNumber = '';
        
     if(string.isNotBlank(phoneNumber) && phoneNumber.length() == 10){
         
     modifiedPhoneNumber +='('+phoneNumber.subString(0,3) + ')' + ' ' +phoneNumber.subString(3,6)+ ' '+phoneNumber.subString(6,8)+' '+phoneNumber.subString(8,10);
            system.debug(modifiedPhoneNumber);     
     }
       return modifiedPhoneNumber;
    }   
    
    
    public static void UpdateAccountPhone(List<Account> acList){
               
        for(Account ac:acList){
            
            if(ac.Phone != null){
               ac.Phone = ModifyPhoneNumber(ac.Phone);
            }            
        }
        update acList;
        
    }
}