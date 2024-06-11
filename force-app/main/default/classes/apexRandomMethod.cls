public class apexRandomMethod {

    
     public static void generateRandomValueFromList(List<string> myList){
         
    // List<string> myList = new List<string>{'gokhan', 'furki','ebrarr','zero'};
         
     Integer randomIndex = Math.mod(Math.round((Math.random()*100)),myList.size());
         
     system.debug(myList.get(randomIndex)); 
    }
}