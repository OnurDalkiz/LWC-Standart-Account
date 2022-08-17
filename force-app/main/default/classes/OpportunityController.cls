public class OpportunityController Implements Schedulable{
    public void execute(system.SchedulableContext SC){
        List<Opportunity> oppList = [SELECT 
                                     id,
                                     Name,
                                     OwnerId,                                     
                                     isClosed__c, 
                                     closeDate 
                                     FROM Opportunity 
                                     WHERE isClosed__c = false 
                                     AND closeDate < TODAY];
        
        TaskUtils.remindOWnersForOpp(oppList);
        
    }

}