public class PaymentUtility {
    
    public static Payment__c getPaymentByID(string paymentId){ //Lesson56
        
        return [SELECT Id,Payment_Status__c,Parent__r.OwnerId, Parent__c FROM Payment__c WHERE Id =: paymentId];
        
    }
    
    
 
    public static Decimal CalculateTotalAmount(Payment__c Payment , Service__c Service){
        
      //!!!!!hepsını utility classlarından cagrdık   || Additional Subject Fee : Ek ders ucretı--> service e baglı        
        Decimal ServiceAmount = ServiceAmountSettingsUtility.GetServiceAmountByPackType(Service.Package__c);        
        Decimal AdditionalSubjectFee = AdditionalSubjectSettingsUtility.GetAmountBySubject(Service.Additional_Subjects__c);        
        Children__c child =  ChildrenUtility.GetChildbyID(Service.Child__c);//referans yazılıyorsa fıeldın yannnda o ID dir        
        Decimal ChildDiscount = ChildDiscountConfigsUtility.CalculateChildDiscount(child.Order__c); //chıldın orderını bulmak ıcn once servıseın chıldını bulmalıyız(uste)             
        Decimal TotalPayment = ServiceAmount + AdditionalSubjectFee;
        Decimal DiscountedAmount = TotalPayment - TotalPayment * ChildDiscount /100;
        
        
        Service__c  SelectedService = ServiceUtility.getServiceById(Service.Id); //service utility den cagrdk
        SelectedService.Total_Amount__c = DiscountedAmount;
        update SelectedService;   //bu after save//not:after save de dml yazılmalı,before save de yazılmaz        
    
        return DiscountedAmount;       
   } 
    
    
        //lesson30 || Task:odeme yapıldgı zaman ,total amountu update edıcez  ||latefee %10 olrk dusun
        public static void FinalPayment(List<Payment__c> paymentList){    //tum tax,amount,fee ler payment obj de
            
            for(Payment__c payment : paymentList){
                
          Decimal PaymentPercentage  =  PaymentMethodSettingsUtility.GetServiceChargeByPaymentMethod(Payment.Payment_Method__c);//metadatadan gelıcek PERCENTAGE
          Decimal PaymentFee = payment.Total_Amount__c * PaymentPercentage/100 ; //toplam mıktarın % sı
          Decimal PaymentTaxPercentage  =  TaxSettingUtility.DefaultTax();   // vergi yuzdesı %7 getırcek   
          Decimal TaxAmount = payment.Total_Amount__c * PaymentTaxPercentage /100;  
          Decimal LateFee = 0.00; 
            
            if(payment.Due_Date__c < payment.Payment_Date__c ){               
                LateFee = payment.Total_Amount__c * 0.1;     
            }
            
                
        Decimal PaidAmount = payment.Total_Amount__c + TaxAmount + LateFee + PaymentFee ;//toplam Miktar + vergi mıktarı + gecıkme ucretı +odemesı gerekenucret
            
            // *************************Assignment ******************************(org takı ısımlerle map yapıp aynı olması lzm)
            
            payment.Tax_Amount__c =TaxAmount; 
            payment.Late_Fee__c = LateFee;
            payment.Payment_Fee__c = PaymentFee;
            payment.Paid_Amount__c = PaidAmount;
             
            if(string.isBlank(payment.Transaction_ID__c)){  //record update edıldgınde TransactionID degsmesın dye 
                
               string TransactionId = generateTransactionID();
                Boolean status = transactionIDisUnique(TransactionId);   
               
                if(status){
                    payment.Transaction_ID__c = TransactionId;
                }else{
                    TransactionId = generateTransactionID();
                    payment.Transaction_ID__c = TransactionId;
          }     
       }   
    }
 }
    
    
      //payment recordunda TransactionID 16 char.olsn,ve 62 den az ındexi olmalı ve update edıldgınde degısmemelı
    public static string generateTransactionID(){
        
      // Belirt!hangi karakterlerden rastgele olstrcagni
        string charSet = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';        
        string TransactionID = ''; //16 character olsun       
        
        //her calıstgında rastgele charSetteki char.lerden alıp TransactionIDıcıne gelmesnı ıstyrm
        for(Integer i=0; i<16; i++){ 
            
          Integer randomIndex = Math.mod(Math.round(Math.random()*350),charSet.length());
            
          TransactionID += charSet.substring(randomIndex,randomIndex+1); //ardısık gelsın ıstyrz          
           }  
           return TransactionID;
        }
    
    
    
      public static Boolean transactionIDisUnique(string TID){ //Transaction_ID__c control edıyrz aynımı degılmı?
        
          List<Payment__c> TIDList = [SELECT Transaction_ID__c FROM Payment__c WHERE Transaction_ID__c =: TID];          
          if(TIDList.size()>0){
              return false;
          }else{
              return true;
          }   
    }   
}