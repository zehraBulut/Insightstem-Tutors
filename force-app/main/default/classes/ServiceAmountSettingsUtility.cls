/* Servise_Amount_Setting__mdt:customMetDATA ||fields:combo,core,single  ||service amountu getırır */

//******************************************************************************************************************************

  public class ServiceAmountSettingsUtility {
    
    public static Decimal GetServiceAmountByPackType(string ServicePackage){
         
      List<Servise_Amount_Setting__mdt> ServiceAmounts = [SELECT Id,Amount__c,Package__c         
                                                          FROM Servise_Amount_Setting__mdt  WHERE label =: ServicePackage ];
                 
      if(!ServiceAmounts.isEmpty()){
          return ServiceAmounts[0].Amount__c; 
      }else{
          return 0.00;
      }
        
    }
}