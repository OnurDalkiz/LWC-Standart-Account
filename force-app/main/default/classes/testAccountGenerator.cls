public class testAccountGenerator Implements Database.Batchable<Account>{
    public Iterable<Account> start(Database.BatchableContext BC){
        List<Account> accList = new List<Account>{new Account(Name='Start Method Account')};
        return accList;
    } 
    public void execute(Database.BatchableContext BC, List<Account> scorp){
        for(Integer i=1;i<201;i++){
            Account acc = new Account(Name='Iterable Batch Apex Test '+i);
            scorp.add(acc);
        }
        database.insert(scorp, false) ;
    }
    public void finish(Database.BatchableContext BC){
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE Id = :BC.getJobId()];
        system.debug(myAsync);
    }
}