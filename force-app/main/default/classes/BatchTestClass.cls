public class BatchTestClass implements Database.Batchable<sObject>, Database.Stateful{
    public Integer counterBatchableContext = 0;
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, Name, Number_Of_Contacs__c, (SELECT Id FROM Contacts) FROM Account');        
    }
    public void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account sc:scope){
            if(sc.Contacts != null){
                sc.Number_Of_Contacs__c = sc.contacts.size();
                counterBatchableContext = counterBatchableContext+1;
            }
        }
        system.debug('List Of Account: ' + scope);
        system.debug('Single Batch Islem Yapilan Kayit Sayisi: ' + counterBatchableContext);  
        update scope;
    }
    public void finish(Database.BatchableContext BC){
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors, TotalJobItems, JobItemsProcessed FROM AsyncApexJob WHERE Id = :bc.getJobId()];
        system.debug('Yapilan Kayit Sayisi: ' + counterBatchableContext); 
        system.debug(myAsync);
    }
}