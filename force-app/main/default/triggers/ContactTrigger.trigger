trigger ContactTrigger on Contact (after insert){
    
    switch on trigger.operationType{
        when AFTER_INSERT{
            set<id> accId = new set<id>();
            for(Contact con:trigger.new){
                if(string.isNotBlank(con.AccountId)){
                    accId.add(con.AccountId);
                }
            }
            list<Contact> conSize = [SELECT Id, Account.Number_Of_Contacs__c FROM Contact WHERE AccountId IN :accId];
            list<Account> accUp = [SELECT Id, Number_Of_Contacs__c FROM Account WHERE Id IN :accId];
            for(Account con:accUp){
                con.Number_Of_Contacs__c = conSize.size()-1;
            }
            
            update accUp;
        }
    }    
}