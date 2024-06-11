public class AdditionalSubjectSettingsUtility {

   public static Decimal GetAmountBySubject(string  Subject){
        
       List<Additional_Subject_Settings__mdt> SubjectList = [SELECT Id,Amount__c,Label      
                                                            FROM Additional_Subject_Settings__mdt  
                                                             WHERE Label =: Subject ];
                 
      if(SubjectList.size()>0){
          return SubjectList.get(0).Amount__c; 
      }else{
          return 0.00;
      }
    } 
}