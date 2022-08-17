public class calculatingAllAccountNumber implements Database.Batchable<sObject>, Database.Stateful{
    
    public Integer counter = 0;
    public Database.QueryLocator start(Database.BatchableContext BC){
        //List<Account> acc = ['SELECT Id, Number_Of_Contacs__c, (SELECT Id, Name FROM Contacts) FROM Account'];
        //return Database.getQueryLocator(acc);
        
        
        return Database.getQueryLocator('SELECT Id, Number_Of_Contacs__c, (SELECT Id, Name FROM Contacts) FROM Account');
              
    }
    
    public void execute (Database.BatchableContext BC, List<Account> mehmet){
        
        for(Account acc:mehmet){
            if(acc.Contacts != null){
                acc.Number_Of_Contacs__c = acc.Contacts.size();
                counter++;
            }
        }
        System.debug('List of Account: '+mehmet);
		System.debug('Single Batch İşlem yapılan kayıt sayısı: '+counter);

        update mehmet;        
    }
    
    public void finish (Database.BatchableContext BC){
        
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors, TotalJobItems, JobItemsProcessed FROM AsyncApexJob  WHERE Id = :bc.getJobId()];
        System.debug('Total İşlem yapılan kayıt sayısı: '+ counter);
        System.debug(myAsync);

                
    }

}