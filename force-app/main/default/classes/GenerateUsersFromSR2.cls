public class GenerateUsersFromSR2 {
    
    public static void generateUsers(){
        
        Map<string, List<String>> myMap = new Map<string, List<String>>();  
        
        Set<String> companyNames = new Set<String>();
        
        
       
        
        StaticResource sr = [SELECT Id, name, body FROM StaticResource WHERE Name ='Users'];
        
        String modifiedBody = sr.body.toString().replace(' ', '');
        
        List<String> emailList = modifiedBody.split(';');
        
        //System.debug(emailList);
        
        for(String email : emailList){
            List<String> res = SplitEmail(email);  //Amazon
            
           
            
            if(!companyNames.contains(res[0])){
                companyNames.add(res[0]);   //key = res[0];
                List<String> userNames = new List<String>();
                userNames.add(res[1]);
                myMap.put(res[0], userNames);

            }
            else {
               
               myMap.get(res[0]).add(res[1]) ;
                
            }

                



           
            
        }
        List<group> groupList = new List<group>();
         
        for(String comname : companyNames){
            Group gr = new Group();
            gr.Name=comname;
            groupList.add(gr);
        }
        
        System.debug(groupList);
        
        insert groupList;
        
        List<User> userList = new List<User>();
        for(Group gr : groupList){
            Id profileId = [SELECT Id FROM Profile WHERE Name ='Identity User' LIMIT 1].Id;
            Integer i=0;
            for(String userName : myMap.get(gr.Name)){
                i+=1;
                List<String> nameParts = userName.split('\\.');
                
                User newUser = new User ();
                
                
                
                newUser.FirstName=nameParts[0];
                newUser.LastName=nameParts[1];
                newUser.Alias=nameParts[0].substring(0,2) + nameParts[1].substring(0,2);
                newUser.Email=userName+i+'@ist.org';
                newUser.username=userName+i+'@ist.org';
                newUser.TimeZoneSidKey='America/Lima';
                newUser.LocaleSidKey='en_US';
                newUser.EmailEncodingKey='UTF-8';
                newUser.LanguageLocaleKey='en_US';
                newUser.ProfileId=profileId;
                

                userList.add(newUser);
                
            }
        }
        
        System.debug(userList.size());
        
        for(User u: userList){
            System.debug(u.username);
        }
        
      insert userList;
        
        
    }
    
    public static List<String> SplitEmail(String email){
        
        String ModifiedEmail = email.replace('.com', '');
        
        List<String> emailParts = ModifiedEmail.split('@');
        
        String companyName = emailParts[1];
        String userName =   emailParts[0]; 
        
        return new List<String>{companyName, userName};
            
            }

    
}