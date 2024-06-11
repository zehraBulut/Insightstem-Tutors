public class OpportunityTriggerHandler {
                                                         //1.param:update ve insertte,2.par:delete'te kulanıcam       
 public static void UpdateAccounts(List<Opportunity>newOpp, Map<Id,Opportunity> oldOppMap,Boolean isInsert, Boolean isUpdate,Boolean isDelete,Boolean isUndelete){ 
                                          
                                          if(isInsert || isUpdate || isUndelete){
                                           updateAccTotalOppAmount(newOpp);  
                                          } else if(isDelete){
                                           updateAccTotalOppAmount(oldOppMap.values());   
                                          }          
                                        }  
    private static void updateAccTotalOppAmount(List<Opportunity> oppL){ //sdc bu clasta calıscak
/*Lesson 61:Account obj de totalOppAmount fieldi olstr, Accountun ıcındekı opp nın stageName =closedWON olanlarn amounları toplamını  Accountun totatloppAmount Fıeldınde göster
Create an Apex trigger named "OpportunityTrigger" to seamlessly update a custom field titled "TotalOpportunityAmount" on the Account 
object upon the closure or winning of an Opportunity linked to said Account. The custom field is intended to aggregate the sum of the Amount values across all successfully closed or won Opportunities associated with the Account  */
        
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp:oppL){
            accountIds.add(opp.AccountId);       
        } 
        List<Account> acL = [SELECT Id, TotalOpportunityAmount__c,Name, 
                             (SELECT Id, StageName ,Amount FROM Opportunities WHERE StageName='Closed Won')
                             FROM Account  WHERE Id IN: accountIds];
        
        for(Account ac:acL){
            Decimal totalAmount =0;
            for(Opportunity opp: ac.Opportunities){
                totalAmount += opp.Amount;
            }
            ac.TotalOpportunityAmount__c = totalAmount;
        }     
        update acL;          
    } 
}