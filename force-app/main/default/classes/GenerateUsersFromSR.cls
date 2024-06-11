public class GenerateUsersFromSR {

    public static void generateUsers(){
        
        Map<String,List<String>> myMap = new Map<String,List<String>>();//Genel list   
        Set<string> companyNames = new Set<string>();//company namelerı tutuyorz        
        
        StaticResource sr = [SELECT Id,Name,Body FROM StaticResource WHERE Name= 'Users'];
        //system.debug(sr);
        
        string modifiedBody = sr.Body.toString().replace(' ','');
        List<String> emailList = modifiedBody.split(';');
        /*test ıcın --> system.debug(emailList.size());
        for(string email : emailList){
            system.debug(email);} */
           
        //********asagdakı olustrulan methodu burda kulanıcaz*******
       for(string email :emailList){
            List<string> result = SplitEmail(email);//methodu cagr emaillistine ve test et
           system.debug(result);  //(companyName,UserName)
       
           if(!companyNames.contains(result[0])){
                companyNames.add(result[0]);//key=result[0];
                
            List<String> userNames = new List<String>();
                userNames.add(result[1]);
                myMap.put(result[0], userNames);
               
             }else {
               myMap.get(result[0]).add(result[1]) ;
            }
        }
        //system.debug(myMap);
        
        
       List<Group> groupList = new List<Group>();
        for(string companyN :companyNames){
            Group gr = new Group();
            gr.Name = companyN;
            groupList.add(gr);
          }
          system.debug(groupList);
        insert groupList;
        
    
        List<User> userL = new List<User>();
        for(Group gr : groupList){
            
            Id profileId= [SELECT Id FROM Profile WHERE Name = 'Identity User' LIMIT 1].Id;
            
            Integer i= 0;
            for(string userName : myMap.get(gr.Name)){  //zehra.bulut
                i+=1;
                List<string> nameParts = userName.split('\\.'); //zehra bulut
                               
                User newUser = new User();
                
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
                userL.add(newUser);      
            }
        }        
          system.debug(userL.size());

        for(User u: userL){
            system.debug(u.username);
        }
             
 insert userL;
            
    } 
         
    public static List<String> SplitEmail(string Email){ //kevin.evans@facebook.com/parcalıcaz ->companyName,username
        
        string ModifiedEmail = email.replace('.com', ''); //kevin.evans@facebook
        List<string> emailParts = ModifiedEmail.split('@');  //kevin.evans , facebook
        string companyName = emailParts[1];//facebook
        string userName = emailParts[0];//kevin.evans
        
        return new List<String>{companyName,userName};
    /*dev console da  test et : List<string> x =GenerateUsersFromSR.SplitEmail('kevin.evans@facebook.com');
      system.debug(x);  --> (facebook, kevin.evans)*/
        
    }

    
}