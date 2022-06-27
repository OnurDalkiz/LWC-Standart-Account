trigger accUpdate on Account (after update) {

    switch on trigger.operationType{

        when AFTER_UPDATE{
            
            set<id> accIds = new set<id>();
            
            for(Account acc : trigger.new){
                
                if(acc.BillingCity != trigger.oldMap.get(acc.Id).BillingCity){
                    
                    accIds.add(acc.Id); 
                }
            }
            
            if(accIds.size()>0){
                
            	List<Contact> conList =[SELECT id, MailingCity, Account.BillingCity FROM Contact WHERE AccountId IN :accIds];
                
                if(conList.size()>0){
            
                    for(Contact con:conList){
                        
                        con.MailingCity = con.Account.BillingCity;
                    }                
                }
                
                update conList;
            }
        }        
    }
}