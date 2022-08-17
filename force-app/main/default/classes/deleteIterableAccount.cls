public class deleteIterableAccount Implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT Id FROM Account WHERE CreatedDate = TODAY]);
    }
    public void execute (Database.BatchableContext BC, list<Account> scope){
        delete scope;
    }
    
    public void finish(Database.BatchableContext BC){
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors FROM AsyncApexJob WHERE Id = :BC.getJobId()];
        system.debug(myAsync);
    }
    
}