public class testAccountGeneratorPractice Implements Database.Batchable<Account>{
    public Iterable<Account> start(Database.BatchableContext BC){
        List<Account> newAccount = new List<Account>{new Account(Name='Test Account Iterable')};
		return newAccount;        
    }
    public void execute(Database.BatchableContext BC, List<Account> scope){
        for(Integer i=1;i<5000;i++){
	        Account acc = new Account(name='Test Account Iterable '+i);
        	scope.add(acc);    
    	}
        insert scope;
    }
    public void finish(Database.BatchableContext BC){
        AsyncApexJob myAsync = [SELECT Id, Status, NumberOfErrors, TotalJobItems, JobItemsProcessed FROM AsyncApexJob WHERE Id = :BC.getJobId()];
		system.debug(myAsync);        
    }
}