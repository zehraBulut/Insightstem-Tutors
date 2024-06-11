//trigger.new trigger.old trigger.newMap trigger.oldMap bunları parameter olrk gonderıp  alıcaz
 //Task: Grade levels da student eklendıgınde / numberof chıldren update edilıp otomatık dolucak
 /***************************************************************************************************************************/
 
public class ChildrenTriggerHandler {
      
    public static void UpdateNumberofChildrenInsert(List<Children__c> childrenList){
        
        Set<Id> gradeLevelIDs = new Set<Id>(); //cocklara baglı grade levellerin ID leri topladık        
           for(Children__c child : childrenList){            
            gradeLevelIDs.add(child.Grade_Level__c);   //  Grade_Level__c = ID dir       
      }               
        List<Grade_Level__c> glList = [SELECT Id, Number_of_Children__c , (SELECT Id FROM Children__r)  //Children__r:custom object
                                       FROM Grade_Level__c 
                                       WHERE Id IN : gradeLevelIDs];    
        
                     for(Grade_Level__c  grade : glList){
                        grade.Number_of_Children__c = grade.Children__r.size();
                     }
                      update glList;
                  }
    
        //grade levelda update olucagı zmn brınde azalıcak dgerınde artıcagı ıcın new ve oldu kulanmak zoorundayız
      public static void UpdateNumberofChildrenUpdate(List<Children__c> OldChildren, List<Children__c> NewChildren){
          
          Set<Id> gradeLevelIDs = new Set<Id>();  //ID leri topladık
               
          for(Children__c  oldChild : OldChildren ){
          for(Children__c  newChild :  NewChildren){
                 
          if(oldChild.Grade_Level__c != newChild.Grade_Level__c){  //degıstgnı anlamak ıcın
                  
          gradeLevelIDs.add(oldChild.Grade_Level__c);
          gradeLevelIDs.add(newChild.Grade_Level__c); // !not:custom Grade_Level_c : chıldrenın lookupı oldg ıcın,chıldren ın ID si olrk kulanıldı burda              
                 } 
              }
          }          
           List<Grade_Level__c> glList = [SELECT Id, Number_of_Children__c , (SELECT Id FROM Children__r) //sınıfın ve ona baglı ogrencılerın ID cagrdk
                                         FROM Grade_Level__c 
                                         WHERE Id IN : gradeLevelIDs];                          
                     for(Grade_Level__c  grade : glList){
                        grade.Number_of_Children__c = grade.Children__r.size();  //snıfın ogrencı sayısı = ogrencı obj.sayısına esıt olmalı                        
                 }
                      update glList;        
               }
   
}