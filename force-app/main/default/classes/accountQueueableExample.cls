public class accountQueueableExample Implements Queueable{
    
    public List<Account> accountList;
    
    public accountQueueableExample (List<Account> accountListParametre){
        List<Account> accountList = new List<Account>();
        this.accountList = accountListParametre;
    }   
    
    public void execute(QueueableContext seria){
        
        for(Account veri:accountList){
            if(veri.Contacts != null){
            veri.Number_Of_Contacs__c = veri.Contacts.size();
            }
        }
        //childQueueableClass childQue = new childQueueableClass();
        update accountList;  
        Id JobId = system.enqueueJob(new childQueueableClass());
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed FROM AsyncApexJob WHERE Id = :JobId];
    }
}