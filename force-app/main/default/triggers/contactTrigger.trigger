trigger contactTrigger on Contact (before insert,before update, before delete,after insert, after update, after delete, after undelete){

    if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){
        
        List<Contact> conL = [SELECT Id,FirstName,LastName,Birthdate FROM Contact];  //tum comtactları al
        Set<String> DublicateValues = new Set<String>();  //set ıcıne contactın fullname ekle
        
        for(Contact con:conL){
         String fullName = con.FirstName + con.LastName + con.Birthdate; //fullname olustur  
           DublicateValues.add(fullName);  //set e ekle contactın fullnameı
      }   
         for(Contact con:Trigger.new){
             string fullName = con.FirstName +  con.LastName + con.Birthdate; //Trigger Listinde ıcındekı  fullname 
             
             if(DublicateValues.contains(fullName)){  //Setin  icinde de varsa fullname 
               con.firstName.addError('There is already contact with the name ' + fullName);  //error ekle
                 
             }           
        }        
    }
  }