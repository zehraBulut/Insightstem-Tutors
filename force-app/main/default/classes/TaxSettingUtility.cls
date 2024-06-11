public class TaxSettingUtility {
   
    public static decimal DefaultTax(){
        
        List<Tax_Settings__mdt> TaxSettings = [SELECT Id,Tax_Percentage__c FROM Tax_Settings__mdt];
        
        
        if(TaxSettings.size()!=0){
            return TaxSettings[0].Tax_Percentage__c;
        }else{
            return 0.00;
        }
    } 
}