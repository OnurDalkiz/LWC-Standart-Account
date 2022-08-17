public class FutureMethodExample {
        
    public Static void createObjects(){//METHOD A
        //Account acc = new Account (name='Test Acc10');
        list<Account> accList = [SELECT Id, Name FROM Account WHERE Name LIKE '%Team%'];
        /*for(Account acc	: accList){
            acc.Name='new record';
        }*/
        delete accList;
        
    	//insert acc;//DML 1
        
        futureClass.newPS('ReadOnlyContract', 'onurdalkiz34@gmail.com');
        
	}
}