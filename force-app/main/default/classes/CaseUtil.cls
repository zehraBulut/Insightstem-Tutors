public class CaseUtil {
     public static void CreateCase(){
       
      Contact con = ContactUtil.CreateContact();
        
        Case cs = new Case();
        cs.Origin = 'Phone';
        cs.Status = 'New';
        cs.ContactId = con.Id;
        cs.AccountId = con.AccountId;
           insert cs;        
    }
}