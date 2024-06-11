trigger accountTrigger on Account (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
   
    //UNIQUE İCİN ORNEKLER--> aynı name ıse error ver;
    
        //1.way:Aynı account name ınsert eklenıcn eerror ver:  
        if(((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)) && false){ //false :calıstırmayı durdurur   
            
         for(Account acc : Trigger.new){             
           
             List<Account> acL = [SELECT Id ,Name FROM Account WHERE Name =: acc.Name];             
             if(acL.size()>0){
                acc.Name.addError('There is already account with the name ' + acc.Name);
             }               
           } 
        } 
         //2.way:
     if(((Trigger.isInsert && trigger.isBefore) || (Trigger.isUpdate && trigger.isBefore)) && false){   
         
         List<Account> acL = [SELECT Id,Name FROM Account];
         Set<string> acNames = new Set<string>();         
         for(Account ac: acL){
            acNames.add(ac.Name);
         }
            for(Account a : Trigger.new){             
                if(acNames.contains(a.Name)){
                    a.Name.addError('2.way: There is already account with the name ' + a.Name);                               
         } 
       }                  
     }          
   
    //3.way:
    
    if(((Trigger.isInsert && trigger.isBefore) || (Trigger.isUpdate && trigger.isBefore)) && false){   
    
        for(Account ac:Trigger.new){
            if(false){
                ac.Name.addError('3.way: There is already account with the name ' + ac.Name);
            }
        }   
    }
    
    
    
    
    
    
    
      // if(Trigger.isUpdate && trigger.isBefore){ }
       if(Trigger.isInsert && trigger.isAfter){ }
       if(Trigger.isUpdate && trigger.isAfter){ }
       if(Trigger.isDelete && trigger.isAfter){ }
       if(Trigger.isunDelete && trigger.isAfter){ }
}