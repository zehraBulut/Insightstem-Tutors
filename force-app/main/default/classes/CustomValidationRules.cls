//BU controller class||TUM Trıggerların ortak kualnıldgı||TUM VALIDATIONLARI 1 YERDE TOPLAMAK ICIN olustrulan CLASS
//picklistlerde isBlank yazılır  null yazılmaz 

public class CustomValidationRules { 
    
   public static ValidationRuleConfig__mdt vrConfigg  = ValidationRuleConfigUtility.GetVRConfig();  //Class variable ||class ıcınde ıstedgn yerde kualanblrsn
    
    
   public static void ServiceValidationRules(List<Service__c> serviceList){  //hangı trıggera baglıcaksan onun objecttypeınn lstnı yazmalsn
            
        for(Service__c  newService : serviceList){
             /*  bırlıkte if condıtıonı olstrdum ama asagıda tek tek olstrdm
           if(newService.Parent__c == null || newService.Child__c ==null || string.isBlank(newService.Plan__c)){
            newService.addError('Parent ,Child and Plan  can not be BLANK');  //ortak error yerı sayfa altı olsn  }  */
           
            if(newService.Parent__c == null && vrConfigg.Parent__c) {
            newService.Parent__c.addError('Parent  can not be BLANK'); 
                
            }
            if(newService.Child__c == null && vrConfigg.Child__c) {
            newService.Child__c.addError('Child can not be BLANK'); 
            }
             
            if(string.isBlank(newService.Plan__c) && vrConfigg.Plan__c) {
            newService.Plan__c.addError('Plan can not be BLANK'); 
            } 
            
          
        }
    }
    
    
     //ERRORLOG ıle VALIDATION RULE olustrduk|| yeni parent ekleyınce ,GURDIAN RSHIP SECILMEDYSE ENGELLEnSIN ||pıcklıst oldgu ıcın isBlank KULANdm
     public static void ParentValidationRule(List<Parent__c> parentList){
         
      for(Parent__c parent : parentList){
          
      if(string.isBlank(parent.Guardian_Relationship__c)){  //parentın gurdianRS secılmedyse,bos ıse asagdakı method calıssın!
             
      if(vrConfigg.Gurdian_Relationship__c || vrConfigg.ALL__c){ //control etmek ıstedgım Gurdian_Relationship__c veya ALL__c true ıse,error ver
       parent.Guardian_Relationship__c.addError('Gurdian Relationship can not be BLANK');  //hata msgını fıeldın altında gosterır (Guardian_Relationship__c) eklersen         
              }                
            }                           
         }             
     }
    
    // yenı chıld eklerken,chıld bos ıse ,valıdatıonruledakı ayarlarmzda ızın veryrsa ALL yada order secılmsse ; valıdatıon rule calısıcak!!! 
     public static void ChildValidationRule(List<Children__c> childrenList){
                   
        for(Children__c child: childrenList){
            if(string.isBlank(child.Order__c)){
               
                if(vrConfigg.ALL__c || vrConfigg.Order__c){  //metadatadakı ALL ve order recordları calısıyorda error ver
                    child.Order__c.addError('Order can not be BLANK'); 
                }
            }
        }
   }
    
 //Task:Payment status is  paid, if payment method is not selected     
     public static void PaymentValidationRules(List<Payment__c> paymentList){
                  
        for(Payment__c payment: paymentList){
            if(payment.Payment_Status__c =='Paid' && string.isBlank(payment.Payment_Method__c)){
               
                if(vrConfigg.ALL__c || vrConfigg.Payment_Status__c){  //metadatadakı ALL ve order recordları calısıyorda error ver
                    payment.Payment_Status__c.addError('Firstly We must Select Payment Method'); 
                }
            }
        }
   }
    
    
    
    
    
}