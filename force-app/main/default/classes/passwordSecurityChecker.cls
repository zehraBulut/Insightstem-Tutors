public class passwordSecurityChecker {

    public static Decimal calculateSecurity(string password){
        
         Boolean hasLowerCase= false; //25 puan
         Boolean hasUpperCase = false; //25 puan
         Boolean hasNumber = false;//25 puan
         Boolean hasSymbol = false;//25 puan
        
        for(Integer i=0; i<password.length(); i++){
            
            string character = password.substring(i,i+1);
            
            if(character.isAlpha() && character.isAllLowerCase()){
                hasLowerCase = true; 
           
            } else if(character.isAlpha() && character.isAllUpperCase()){
                hasUpperCase = true;
                
            }else if(character.isNumeric()){
                hasNumber =true;
            }else{
               hasSymbol = true; 
            }
          }   
     
        Decimal score =0;
        if(hasLowerCase) score += 25;
        if(hasUpperCase) score += 25;
        if(hasNumber) score += 25;
        if(hasSymbol) score += 25;
        
        
        return score;
    }
}