public class accountBatchClass implements Database.Batchable<sObject>, Database.Stateful{
    public Integer counterBatchableContext=0;    
    public Database.QueryLocator start(Database.BatchableContext BC){//HEAD
      return Database.getQueryLocator('SELECT Id, Name, Number_Of_Contacs__c, (SELECT Id FROM Contacts) FROM Account');
    //Buradan gelen bilgiler execute da bulunan scope degiskeninin icine atanir.
    }

   public void execute(Database.BatchableContext BC, List<Account> scope){//BODY
       for(Account s : scope){
           if(s.Contacts != null){
               s.Number_Of_Contacs__c = s.contacts.size();
               system.debug('Account Name : '+ s.Name);
               counterBatchableContext ++;
           }
       }
       system.debug('Account Number:'+ scope.size());
       system.Debug('Islem Goren Toplam Account Sayisi : ' + counterBatchableContext);
       update scope;
   }

   public void finish(Database.BatchableContext BC){//ALT METIN
       AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors FROM AsyncApexJob WHERE Id = :BC.getJobId()];
       system.debug(myAsync);
       system.Debug('Islem Goren Toplam Account Sayisi : ' + counterBatchableContext++);
   }
}