public class ChildDiscountConfigsUtility {
  
    public static Decimal CalculateChildDiscount(string Label){
         
      List<Child_Discount_Config__mdt> ChildDiscounts = [SELECT Id,Discount__c,Label      
                                                            FROM Child_Discount_Config__mdt  
                                                             WHERE Label =: Label ];   //1.Label custom field //Child Discount Configs e grdgınde baslıktır
                 
      if(ChildDiscounts.isEmpty()){
          return 0.00; 
      }else{
          return ChildDiscounts[0].Discount__c;
      }
    }
}