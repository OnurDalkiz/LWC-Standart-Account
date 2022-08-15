trigger TriggerNumberOfContactCalculator on Contact (after insert) {
    set<Id> accId = new set<Id>();
    for(Contact con:trigger.new){
        if(con.Account != null){
            accId.add(con.Account.Id);
        }
    }
    if(accId != null){
        List<Account> accList = [SELECT Id, Number_Of_Contacs__c, (SELECT Id FROM Contacts) FROM Account WHERE Id = :accId];
        for(Account acc:accList){
                acc.Number_Of_Contacs__c = acc.contacts.size();
        }    
        update accList;
    }    
}